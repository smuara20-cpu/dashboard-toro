
$ErrorActionPreference = "Stop"
Set-Location "C:\FlutterProject\dashboard_kpi"

$file = ".\lib\features\marketing_intelligence\presentation\pages\marketing_intelligence_pages.dart"
$source = [IO.File]::ReadAllText((Resolve-Path $file))
$backup = "$file.bak-patch2b-$(Get-Date -Format 'yyyyMMdd-HHmmss')"

function Replace-Once([string]$text, [string]$pattern, [string]$replacement) {
    $regex = [regex]::new($pattern)
    $matches = $regex.Matches($text)
    if ($matches.Count -ne 1) {
        throw "Pola harus ditemukan tepat satu kali: $pattern (ditemukan $($matches.Count))"
    }
    $m = $matches[0]
    return $text.Substring(0, $m.Index) + $replacement +
        $text.Substring($m.Index + $m.Length)
}

# Preflight: pastikan patch hanya menyasar form sosial.
if ($source -notmatch 'class _PlatformConnectionForm extends StatefulWidget') {
    throw "Form sosial sudah berubah atau tidak ditemukan. Tidak ada perubahan."
}
if ($source -notmatch 'class _PlatformConnectionFormState extends State<_PlatformConnectionForm>') {
    throw "State form sosial tidak ditemukan. Tidak ada perubahan."
}
if ($source -notmatch "onPressed: _validateConfiguration,") {
    throw "Tombol form sosial tidak ditemukan. Tidak ada perubahan."
}

Copy-Item $file $backup
try {
    $source = Replace-Once $source `
      "import 'package:flutter/material.dart';" `
      "import 'package:flutter/material.dart';`r`nimport 'package:flutter_riverpod/flutter_riverpod.dart';"

    $source = Replace-Once $source `
      "import 'package:dashboard_kpi/app/router/route_paths.dart';" `
      ("import 'package:dashboard_kpi/app/router/route_paths.dart';`r`n" +
       "import 'package:dashboard_kpi/features/auth/application/providers/session_provider.dart';`r`n" +
       "import 'package:dashboard_kpi/features/marketing_intelligence/application/providers/marketing_platform_config_provider.dart';")

    $source = Replace-Once $source `
      'class _PlatformConnectionForm extends StatefulWidget' `
      'class _PlatformConnectionForm extends ConsumerStatefulWidget'

    $source = Replace-Once $source `
      'State<_PlatformConnectionForm> createState()' `
      'ConsumerState<_PlatformConnectionForm> createState()'

    $source = Replace-Once $source `
      'class _PlatformConnectionFormState extends State<_PlatformConnectionForm>' `
      'class _PlatformConnectionFormState extends ConsumerState<_PlatformConnectionForm>'

    $fields = @'
  bool _validated = false;
  bool _loadingConfig = true;
  bool _savingConfig = false;

  String get _platformKey => switch (widget.platform) {
    MarketingPlatform.instagram => 'instagram',
    MarketingPlatform.metaAds => 'meta_ads',
    MarketingPlatform.tiktokAds => 'tiktok_ads',
    _ => throw StateError('Platform sosial tidak didukung.'),
  };

  @override
  void initState() {
    super.initState();
    _loadConfiguration();
  }

  Future<void> _loadConfiguration() async {
    final tenantId = ref.read(sessionStateProvider).sessionContext?.tenantId;
    if (tenantId == null || tenantId.isEmpty) {
      if (mounted) setState(() => _loadingConfig = false);
      return;
    }

    try {
      final config = await ref
          .read(marketingPlatformConfigDataSourceProvider)
          .fetchConfig(tenantId: tenantId, platform: _platformKey);

      if (!mounted) return;
      if (config != null) {
        _profileController.text = config['profile_url'] as String? ?? '';
        _accountIdController.text =
            config['external_account_id'] as String? ?? '';
      }
    } catch (_) {
      // Kegagalan pemuatan tidak dianggap sebagai konfigurasi tersimpan.
    } finally {
      if (mounted) setState(() => _loadingConfig = false);
    }
  }
'@

    $source = Replace-Once $source '  bool _validated = false;' $fields

    $saveMethod = @'
  Future<void> _saveConfiguration() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;

    final tenantId = ref.read(sessionStateProvider).sessionContext?.tenantId;
    if (tenantId == null || tenantId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sesi tenant tidak tersedia. Silakan login ulang.')),
      );
      return;
    }

    setState(() => _savingConfig = true);
    try {
      await ref.read(marketingPlatformConfigDataSourceProvider).saveConfig(
        tenantId: tenantId,
        platform: _platformKey,
        profileUrl: _profileController.text,
        externalAccountId: _accountIdController.text,
      );

      if (!mounted) return;
      setState(() => _validated = true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Konfigurasi berhasil disimpan ke Supabase.')),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gagal menyimpan. Periksa migration, koneksi, dan izin tenant.'),
        ),
      );
    } finally {
      if (mounted) setState(() => _savingConfig = false);
    }
  }
'@

    $source = Replace-Once $source `
      '(?s)  void _validateConfiguration\(\)\s*\{.*?\r?\n  \}' `
      $saveMethod

    $source = Replace-Once $source `
      'onPressed: _validateConfiguration,' `
      'onPressed: (_loadingConfig || _savingConfig) ? null : _saveConfiguration,'

    $source = Replace-Once $source `
      "label: const Text\('Validasi Konfigurasi'\)," `
      "label: Text(_savingConfig ? 'Menyimpan...' : 'Simpan Konfigurasi'),"

    # Pastikan tidak ada sisa method lama atau perubahan yang gagal.
    if ($source -match '_validateConfiguration') {
      throw "Masih ditemukan referensi method validasi lama."
    }

    [IO.File]::WriteAllText(
      (Resolve-Path $file),
      $source,
      (New-Object System.Text.UTF8Encoding($false))
    )

    Write-Host "Patch form sosial diterapkan. Backup: $backup" -ForegroundColor Green
}
catch {
    Copy-Item $backup $file -Force
    Write-Host "Patch gagal; file dikembalikan ke backup." -ForegroundColor Red
    throw
}
