$ErrorActionPreference = "Stop"
Set-Location "C:\FlutterProject\dashboard_kpi"
$file = ".\lib\features\marketing_intelligence\presentation\pages\marketing_intelligence_pages.dart"
$fullPath = (Resolve-Path $file).Path
$backup = "$fullPath.bak-social-v3-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
$originalBytes = [System.IO.File]::ReadAllBytes($fullPath)
$utf8 = New-Object System.Text.UTF8Encoding($false, $true)
$source = $utf8.GetString($originalBytes)

function Replace-Once {
    param([string]$Text,[string]$Pattern,[string]$Replacement,[string]$Label)
    $found = [regex]::Matches($Text, $Pattern)
    if ($found.Count -ne 1) { throw "Pola '$Label' ditemukan $($found.Count) kali; perlu tepat satu." }
    $m = $found[0]
    return $Text.Substring(0,$m.Index) + $Replacement + $Text.Substring($m.Index + $m.Length)
}

$fieldReplacement = @'
bool _validated = false;
  bool _loadingConfig = true;
  bool _savingConfig = false;
  String? _loadError;
'@

$methodsReplacement = @'
  @override
  void initState() {
    super.initState();
    _loadConfiguration();
  }

  String get _platformKey => switch (widget.platform) {
    MarketingPlatform.instagram => 'instagram',
    MarketingPlatform.metaAds => 'meta_ads',
    MarketingPlatform.tiktokAds => 'tiktok_ads',
    _ => throw StateError('Platform ini bukan platform sosial.'),
  };

  Future<void> _loadConfiguration() async {
    try {
      final session = ref.read(sessionStateProvider);
      final tenantId = session.sessionContext?.tenantId;
      if (tenantId == null || tenantId.trim().isEmpty) {
        throw StateError('Sesi tenant tidak tersedia. Silakan login ulang.');
      }
      final config = await ref.read(marketingPlatformConfigDataSourceProvider)
          .fetchConfig(tenantId: tenantId, platform: _platformKey);
      if (!mounted) return;
      if (config != null) {
        _profileController.text = (config['profile_url'] as String?) ?? '';
        _accountIdController.text =
            (config['external_account_id'] as String?) ?? '';
      }
      setState(() {
        _loadingConfig = false;
        _loadError = null;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _loadingConfig = false;
        _loadError = 'Konfigurasi belum dapat dimuat. Periksa koneksi dan akses database.';
      });
    }
  }

  Future<void> _saveConfiguration() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate() || _savingConfig) return;
    setState(() {
      _savingConfig = true;
      _validated = false;
    });
    try {
      final session = ref.read(sessionStateProvider);
      final tenantId = session.sessionContext?.tenantId;
      if (tenantId == null || tenantId.trim().isEmpty) {
        throw StateError('Sesi tenant tidak tersedia. Silakan login ulang.');
      }
      await ref.read(marketingPlatformConfigDataSourceProvider).saveConfig(
        tenantId: tenantId,
        platform: _platformKey,
        profileUrl: _profileController.text.trim(),
        externalAccountId: _accountIdController.text.trim(),
      );
      if (!mounted) return;
      setState(() {
        _validated = true;
        _loadError = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Konfigurasi berhasil disimpan.')),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(
          'Gagal menyimpan. Periksa sesi login, tabel database, dan kebijakan akses tenant.',
        )),
      );
    } finally {
      if (mounted) setState(() => _savingConfig = false);
    }
  }

  @override
  void dispose()
'@

$statusReplacement = @'
if (_validated)
                    const Chip(
                      avatar: Icon(Icons.check_circle_outline, size: 18),
                      label: Text('Konfigurasi tersimpan'),
                    ),
'@

$loadingReplacement = @'
              if (_loadingConfig) const LinearProgressIndicator(),
              if (_loadError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    _loadError!,
                    style: TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                ),
              const SizedBox(height: 20),
'@

$riverpodImport = @'
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
'@

$providerImports = @'
import 'package:dashboard_kpi/app/router/route_paths.dart';
import 'package:dashboard_kpi/features/auth/application/providers/session_provider.dart';
import 'package:dashboard_kpi/features/marketing_intelligence/application/providers/marketing_platform_config_provider.dart';
'@

try {
    $start = $source.IndexOf("class _PlatformConnectionForm extends StatefulWidget")
    if ($start -lt 0) { throw "Form sosial versi awal tidak ditemukan." }
    $end = $source.IndexOf("class _GoogleConnectionForm extends StatefulWidget", $start)
    if ($end -le $start) { throw "Batas form Google tidak ditemukan." }
    $social = $source.Substring($start, $end - $start)

    $social = Replace-Once $social 'class _PlatformConnectionForm extends StatefulWidget' 'class _PlatformConnectionForm extends ConsumerStatefulWidget' 'widget sosial'
    $social = Replace-Once $social 'State<_PlatformConnectionForm> createState\(\)' 'ConsumerState<_PlatformConnectionForm> createState()' 'createState sosial'
    $social = Replace-Once $social 'class _PlatformConnectionFormState extends State<_PlatformConnectionForm>' 'class _PlatformConnectionFormState extends ConsumerState<_PlatformConnectionForm>' 'state sosial'
    $social = Replace-Once $social 'bool _validated = false;' $fieldReplacement 'field state'
    $social = Replace-Once $social '  @override\s+void dispose\(\)' $methodsReplacement 'load/save dan dispose'
    $social = Replace-Once $social '(?s)  void _validateConfiguration\(\)\s*\{.*?\n  \}\s*\n' '' 'hapus validasi lokal'
    $social = Replace-Once $social 'onPressed: _validateConfiguration,' 'onPressed: (_loadingConfig || _savingConfig) ? null : _saveConfiguration,' 'tombol simpan'
    $social = Replace-Once $social "label: const Text\('Validasi Konfigurasi'\)," "label: Text(_savingConfig ? 'Menyimpan...' : 'Simpan Konfigurasi')," 'label tombol'
    $social = Replace-Once $social "(?s)if \(_validated\)\s+const Chip\(\s+avatar: Icon\(Icons\.check_circle_outline, size: 18\),\s+label: Text\('Input valid[^']*'\),\s+\)," $statusReplacement 'status simpan'
    $social = Replace-Once $social '              const SizedBox\(height: 20\),' $loadingReplacement 'loading/error'

    $source = Replace-Once $source "import 'package:flutter/material.dart';" $riverpodImport 'import Riverpod'
    $source = Replace-Once $source "import 'package:dashboard_kpi/app/router/route_paths.dart';" $providerImports 'import providers'

    $start2 = $source.IndexOf("class _PlatformConnectionForm extends StatefulWidget")
    if ($start2 -lt 0) { throw "Widget sosial hasil transformasi tidak ditemukan." }
    $end2 = $source.IndexOf("class _GoogleConnectionForm extends StatefulWidget", $start2)
    if ($end2 -le $start2) { throw "Batas Google berubah atau hilang." }
    $source = $source.Substring(0,$start2) + $social + $source.Substring($end2)

    if ($source -notmatch 'Future<void> _saveConfiguration\(\)') { throw "Metode simpan tidak ditemukan." }
    if ($source -notmatch 'class _GoogleConnectionForm extends StatefulWidget') { throw "Form Google tidak ditemukan." }

    [System.IO.File]::WriteAllBytes($backup, $originalBytes)
    [System.IO.File]::WriteAllBytes($fullPath, $utf8.GetBytes($source))
    Write-Host "`nPATCH BERHASIL DITERAPKAN" -ForegroundColor Green
    Write-Host "Backup byte-for-byte: $backup" -ForegroundColor Cyan
}
catch {
    [System.IO.File]::WriteAllBytes($fullPath, $originalBytes)
    Write-Host "`nPATCH GAGAL - SOURCE DIKEMBALIKAN" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Yellow
    if (Test-Path $backup) { Write-Host "Backup: $backup" -ForegroundColor Cyan }
    exit 1
}
