
$ErrorActionPreference = "Stop"

Set-Location "C:\FlutterProject\dashboard_kpi"

$file = ".\lib\features\marketing_intelligence\presentation\pages\marketing_intelligence_pages.dart"
$source = Get-Content $file -Ra
$original = $source

function Replace-Once {
    param(
        [string]$Text,
        [string]$Pattern,
        [string]$Replacement,
        [string]$Label
    )

    $matches = [regex]::Matches($Text, $Pattern)
    if ($matches.Count -ne 1) {
        throw "Preflight gagal: '$Label' ditemukan $($matches.Count) kali, seharusnya tepat satu."
    }

    $m = $matches[0]
    return $Text.Substring(0, $m.Index) +
        $Replacement +
        $Text.Substring($m.Index + $m.Length)
}

$backup = "$file.bak-social-v2-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
Copy-Item $file $backup

try {
    # Pastikan kedua batas class benar sebelum menyentuh source.
    $start = $source.IndexOf("class _PlatformConnectionForm extends StatefulWidget")
    $end = $source.IndexOf("class _GoogleConnectionForm", $start)

    if ($start -lt 0 -or $end -le $start) {
        throw "Batas form sosial/Google tidak ditemukan. Source tidak boleh diubah."
    }

    $social = $source.Substring($start, $end - $start)

    # Ubah hanya form sosial menjadi ConsumerStatefulWidget.
    $social = Replace-Once $social `
        'class _PlatformConnectionForm extends StatefulWidget' `
        'class _PlatformConnectionForm extends ConsumerStatefulWidget' `
        'deklarasi widget sosial'

    $social = Replace-Once $social `
        'State<_PlatformConnectionForm> createState\(\)' `
        'ConsumerState<_PlatformConnectionForm> createState()' `
        'createState sosial'

    $social = Replace-Once $social `
        'class _PlatformConnectionFormState extends State<_PlatformConnectionForm>' `
        'class _PlatformConnectionFormState extends ConsumerState<_PlatformConnectionForm>' `
        'state sosial'

    $social = Replace-Once $social `
        'bool _validated = false;' `
        @'
bool _validated = false;
  bool _loadingConfig = true;
  bool _savingConfig = false;
  String? _loadError;
'@ `
        'state loading/saving sosial'

    # Tambahkan proses baca konfigurasi saat form dibuka.
    $social = Replace-Once $social `
        '  @override\s+void dispose\(\)' `
        @'
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

      final config = await ref
          .read(marketingPlatformConfigDataSourceProvider)
          .fetchConfig(
            tenantId: tenantId,
            platform: _platformKey,
          );

      if (!mounted) return;

      if (config != null) {
        _profileController.text =
            (config['profile_url'] as String?) ?? '';
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
        _loadError =
            'Konfigurasi belum dapat dimuat. Periksa koneksi dan akses database.';
      });
    }
  }

  Future<void> _saveConfiguration() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;
    if (_savingConfig) return;

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

      await ref
          .read(marketingPlatformConfigDataSourceProvider)
          .saveConfig(
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
        const SnackBar(
          content: Text('Konfigurasi berhasil disimpan.'),
        ),
      );
    } catch (_) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Gagal menyimpan. Periksa sesi login, tabel database, dan kebijakan akses tenant.',
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _savingConfig = false);
      }
    }
  }

  @override
  void dispose()
'@ `
        'initState dan metode konfigurasi sosial'

    # Ganti tombol validasi menjadi tombol simpan.
    $social = Replace-Once $social `
        'onPressed: _validateConfiguration,' `
        'onPressed: (_loadingConfig || _savingConfig) ? null : _saveConfiguration,' `
        'aksi tombol sosial'

    $social = Replace-Once $social `
        "label: const Text\('Validasi Konfigurasi'\)," `
        "label: Text(_savingConfig ? 'Menyimpan...' : 'Simpan Konfigurasi')," `
        'label tombol sosial'

    # Status hanya ditampilkan setelah upsert berhasil.
    $social = Replace-Once $social `
        '(?s)if \(_validated\)\s+const Chip\(.*?\n                    \),' `
        @'
if (_validated)
                    const Chip(
                      avatar: Icon(Icons.check_circle_outline, size: 18),
                      label: Text('Konfigurasi tersimpan'),
                    ),
'@ `
        'status penyimpanan sosial'

    # Tampilkan loading dan pesan kegagalan baca konfigurasi.
    $social = Replace-Once $social `
        '              const SizedBox\(height: 20\),' `
        @'
              if (_loadingConfig) const LinearProgressIndicator(),
              if (_loadError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    _loadError!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              const SizedBox(height: 20),
'@ `
        'indikator loading dan error sosial'

    # Tambahkan import yang diperlukan.
    $source = Replace-Once $source `
        "import 'package:flutter/material.dart';" `
        @'
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
'@ `
        'import Riverpod'

    $source = Replace-Once $source `
        "import 'package:dashboard_kpi/app/router/route_paths.dart';" `
        @'
import 'package:dashboard_kpi/app/router/route_paths.dart';
import 'package:dashboard_kpi/features/auth/application/providers/session_provider.dart';
import 'package:dashboard_kpi/features/marketing_intelligence/application/providers/marketing_platform_config_provider.dart';
'@ `
        'import provider sesi dan konfigurasi'

    # Pasang kembali blok sosial tanpa mengubah blok Google.
    $start = $source.IndexOf("class _PlatformConnectionForm extends ConsumerStatefulWidget")
    $end = $source.IndexOf("class _GoogleConnectionForm", $start)

    if ($start -lt 0 -or $end -le $start) {
        throw "Batas form berubah saat patch. Membatalkan."
    }

    $source = $source.Substring(0, $start) + $social +
        $source.Substring($end)

    # Pemeriksaan akhir sebelum menulis.
    if ($source -eq $original) {
        throw "Tidak ada perubahan source yang dihasilkan."
    }

    if ($source -notmatch 'class _GoogleConnectionForm extends StatefulWidget') {
        throw "Pemeriksaan gagal: deklarasi form Google berubah atau hilang."
    }

    if ($source -notmatch 'marketingPlatformConfigDataSourceProvider') {
        throw "Pemeriksaan gagal: provider konfigurasi tidak ditemukan."
    }

    if ($source -notmatch 'Future<void> _saveConfiguration\(\)') {
        throw "Pemeriksaan gagal: metode simpan tidak ditemukan."
    }

    $encoding = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText(
        (Resolve-Path $file).Path,
        $source,
        $encoding
    )

    Write-Host "`nPATCH BERHASIL DITERAPKAN" -ForegroundColor Green
    Write-Host "Backup: $backup" -ForegroundColor Cyan
    Write-Host "Form sosial: diperbarui"
    Write-Host "Form Google: batas class dipertahankan"
}
catch {
    $encoding = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText(
        (Resolve-Path $file).Path,
        $original,
        $encoding
    )

    Write-Host "`nPATCH GAGAL - SOURCE DIKEMBALIKAN" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Yellow
    Write-Host "Backup tetap tersedia: $backup" -ForegroundColor Cyan
    exit 1
}
