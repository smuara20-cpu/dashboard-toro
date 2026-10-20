import { createClient } from "npm:@supabase/supabase-js@2";

const allowedOrigins = new Set([
  "https://dashboard-toro.pages.dev",
  "http://localhost:3000",
  "http://localhost:5000",
  "http://localhost:8080",
]);

function corsHeaders(origin: string | null): Record<string, string> {
  const headers: Record<string, string> = {
    "Access-Control-Allow-Headers":
      "authorization, x-client-info, apikey, content-type",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Vary": "Origin",
    "Content-Type": "application/json",
  };

  if (origin && allowedOrigins.has(origin)) {
    headers["Access-Control-Allow-Origin"] = origin;
  }

  return headers;
}

function jsonResponse(
  status: number,
  body: Record<string, unknown>,
  headers: Record<string, string>,
): Response {
  return new Response(JSON.stringify(body), { status, headers });
}

Deno.serve(async (req: Request) => {
  const origin = req.headers.get("origin");
  const headers = corsHeaders(origin);

  if (origin && !allowedOrigins.has(origin)) {
    return jsonResponse(403, { error: "ORIGIN_NOT_ALLOWED" }, headers);
  }

  if (req.method === "OPTIONS") {
    return new Response("ok", { status: 200, headers });
  }

  if (req.method !== "POST") {
    return jsonResponse(405, { error: "METHOD_NOT_ALLOWED" }, headers);
  }

  const authorization = req.headers.get("Authorization");
  if (!authorization?.startsWith("Bearer ")) {
    return jsonResponse(401, { error: "UNAUTHENTICATED" }, headers);
  }

  const supabaseUrl = Deno.env.get("SUPABASE_URL");
  const publishableKey =
    Deno.env.get("SUPABASE_ANON_KEY") ??
    Deno.env.get("SUPABASE_PUBLISHABLE_KEY");

  if (!supabaseUrl || !publishableKey) {
    console.error("Supabase URL or publishable key is not configured.");
    return jsonResponse(500, { error: "SERVER_CONFIGURATION_ERROR" }, headers);
  }

  try {
    const supabase = createClient(supabaseUrl, publishableKey, {
      global: { headers: { Authorization: authorization } },
      auth: { persistSession: false, autoRefreshToken: false },
    });

    const { data: userResult, error: userError } = await supabase.auth.getUser();

    if (userError || !userResult.user) {
      return jsonResponse(401, { error: "UNAUTHENTICATED" }, headers);
    }

    const { data, error } = await supabase.rpc(
      "resolve_effective_tenant_access",
    );

    if (error) {
      const message = error.message ?? "";

      if (
        message.includes("TENANT_ACCESS_NOT_FOUND") ||
        message.includes("INVALID_ACCESS_CONTEXT") ||
        message.includes("UNAUTHENTICATED")
      ) {
        return jsonResponse(403, { error: "TENANT_ACCESS_DENIED" }, headers);
      }

      console.error("Tenant access resolution failed:", error.code ?? "unknown");
      return jsonResponse(500, { error: "TENANT_ACCESS_CHECK_FAILED" }, headers);
    }

    const accessRows = Array.isArray(data) ? data : [];

    if (accessRows.length !== 1) {
      return jsonResponse(403, { error: "TENANT_ACCESS_DENIED" }, headers);
    }

    const access = accessRows[0];

    if (
      access.user_id !== userResult.user.id ||
      !access.tenant_id ||
      !access.company_id
    ) {
      return jsonResponse(403, { error: "TENANT_ACCESS_DENIED" }, headers);
    }

    return jsonResponse(200, {
      status: "authorized",
      user_id: access.user_id,
      tenant_id: access.tenant_id,
      company_id: access.company_id,
    }, headers);
  } catch {
    return jsonResponse(500, { error: "INTERNAL_SERVER_ERROR" }, headers);
  }
});
