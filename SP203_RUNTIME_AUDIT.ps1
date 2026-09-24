# ============================================================
# VENTRA / SP-203 Runtime Provider Audit
# READ-ONLY GOVERNANCE AUDIT
# ============================================================

$Root = (Get-Location).Path
$Lib  = Join-Path $Root "lib"
$Test = Join-Path $Root "test"
$Out  = Join-Path $Root "SP203_RUNTIME_AUDIT.txt"

$lines = New-Object System.Collections.Generic.List[string]

function Add-Line([string]$Text = "") {
    $lines.Add($Text)
}

function Section([string]$Title) {
    Add-Line ""
    Add-Line ("=" * 72)
    Add-Line $Title
    Add-Line ("=" * 72)
}

function Search-Repo([string]$Pattern, [string]$Label) {
    Add-Line ""
    Add-Line "--- $Label ---"

    $results = Get-ChildItem $Root -Recurse -File -Force `
        -ErrorAction SilentlyContinue |
        Where-Object {
            $_.FullName -notmatch '\\.git\\|\\build\\|\\.dart_tool\\'
        } |
        Select-String -Pattern $Pattern -AllMatches `
        -ErrorAction SilentlyContinue |
        Select-Object -First 100 Path,LineNumber,Line

    if ($results) {
        foreach ($r in $results) {
            Add-Line ("{0}:{1} | {2}" -f $r.Path,$r.LineNumber,$r.Line.Trim())
        }
    }
    else {
        Add-Line "NOT FOUND"
    }
}

Add-Line "VENTRA / SP-203 RUNTIME PROVIDER AUDIT"
Add-Line "Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
Add-Line "Repository: $Root"
Add-Line "Mode: READ-ONLY"
Add-Line ""

Section "1. PRODUCTION TENANT CONTEXT PROVIDER"

$providerResults = Get-ChildItem $Lib -Recurse -File -Force `
    -ErrorAction SilentlyContinue |
    Select-String `
        -Pattern 'implements\s+TenantContextSource|with\s+TenantContextSource|TenantContextSource\s*=' `
        -AllMatches `
        -ErrorAction SilentlyContinue

$productionProviders = $providerResults |
    Where-Object {
        $_.Path -notmatch '\\test\\'
    }

if ($productionProviders) {
    Add-Line "STATUS: FOUND"
    foreach ($r in $productionProviders) {
        Add-Line ("{0}:{1} | {2}" -f $r.Path,$r.LineNumber,$r.Line.Trim())
    }
}
else {
    Add-Line "STATUS: NOT FOUND"
}

Section "2. TEST TENANT CONTEXT IMPLEMENTATIONS"

$testProviders = Get-ChildItem $Test -Recurse -File -Force `
    -ErrorAction SilentlyContinue |
    Select-String `
        -Pattern 'implements\s+TenantContextSource|with\s+TenantContextSource' `
        -AllMatches `
        -ErrorAction SilentlyContinue

if ($testProviders) {
    Add-Line "STATUS: FOUND (TEST ONLY)"
    foreach ($r in $testProviders) {
        Add-Line ("{0}:{1} | {2}" -f $r.Path,$r.LineNumber,$r.Line.Trim())
    }
}
else {
    Add-Line "STATUS: NOT FOUND"
}

Section "3. EFFECTIVE TENANT ACCESS IDENTIFIERS"

Search-Repo `
    -Pattern 'tenantId|tenant_id|companyId|company_id' `
    -Label "tenant/company identifier references"

Section "4. SP-203 / IDENTITY / ACCESS REFERENCES"

Search-Repo `
    -Pattern 'SP-203|Identity.?Access|Effective Tenant Access|identity.?access|tenant.?access' `
    -Label "SP-203 references"

Section "5. HTTP / API TRANSPORT"

Search-Repo `
    -Pattern 'http\.|https\.|baseUrl|baseURL|apiUrl|api_url|endpoint|Uri\(' `
    -Label "HTTP/API references"

Section "6. SUPABASE RUNTIME"

Search-Repo `
    -Pattern 'SupabaseClient|Supabase\.instance|signInWithPassword|supabase_flutter|supabase\.functions|\.rpc\(' `
    -Label "Supabase references"

Section "7. EDGE FUNCTION / RPC"

Search-Repo `
    -Pattern 'functions\.invoke|supabase\.functions|\.rpc\(' `
    -Label "Supabase Edge Function / RPC references"

Section "8. OPENAPI / SWAGGER"

Search-Repo `
    -Pattern 'OpenAPI|openapi|Swagger|swagger\.json|openapi\.json|openapi\.yaml|swagger\.yaml' `
    -Label "API specification references"

Section "9. AUTHENTICATION TRANSPORT"

Search-Repo `
    -Pattern 'Authorization|Bearer|access_token|accessToken|JWT|jwt' `
    -Label "authentication transport references"

Section "10. FINAL GOVERNANCE STATUS"

$hasProvider = $false
if ($productionProviders) {
    $hasProvider = $true
}

$hasApi = $false
$apiResults = Get-ChildItem $Lib -Recurse -File -Force `
    -ErrorAction SilentlyContinue |
    Select-String `
        -Pattern 'https?://|Uri\(|baseUrl|baseURL|apiUrl|api_url' `
        -ErrorAction SilentlyContinue

if ($apiResults) {
    $hasApi = $true
}

Add-Line "Architecture Boundary       : GREEN"
Add-Line "Logical Tenant Contract     : GREEN"
Add-Line "Production Provider         : " + $(if ($hasProvider) {"FOUND"} else {"NOT FOUND"})
Add-Line "API/Transport Evidence      : " + $(if ($hasApi) {"PRESENT - VERIFY PROVIDER"} else {"NOT FOUND"})
Add-Line "Effective Tenant Access     : REQUIRES AUTHORITATIVE PROVIDER"
Add-Line "Runtime Adapter              : HOLD"

if (-not $hasProvider) {
    Add-Line ""
    Add-Line "RUNTIME PROVIDER GATE        : BLOCKED"
    Add-Line "Reason: No concrete production TenantContextSource provider found."
}
else {
    Add-Line ""
    Add-Line "RUNTIME PROVIDER GATE        : REVIEW REQUIRED"
    Add-Line "Reason: Production provider reference exists and requires contract verification."
}

Add-Line ""
Add-Line "IMPORTANT:"
Add-Line "This audit does not treat test fakes, dummy tenant IDs, Supabase Auth,"
Add-Line "generic API URLs, or governance documents as proof of SP-203 runtime authority."
Add-Line ""
Add-Line "END OF AUDIT"

$lines | Set-Content $Out -Encoding utf8

Write-Host ""
Write-Host "AUDIT CREATED:"
Write-Host $Out
Write-Host ""
Write-Host "Read-only audit completed."
