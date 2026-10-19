import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:dashboard_kpi/app/router/route_paths.dart';

enum MarketingPlatform {
  instagram,
  metaAds,
  tiktokAds,
  googleAds,
  googleAnalytics,
  googleTagManager,
}

extension MarketingPlatformInfo on MarketingPlatform {
  String get title => switch (this) {
    MarketingPlatform.instagram => 'Instagram Intelligence',
    MarketingPlatform.metaAds => 'Facebook Business / Meta Ads',
    MarketingPlatform.tiktokAds => 'TikTok Business Intelligence',
    MarketingPlatform.googleAds => 'Google Ads Intelligence',
    MarketingPlatform.googleAnalytics => 'Google Analytics Intelligence',
    MarketingPlatform.googleTagManager => 'Google Tag Manager',
  };

  String get description => switch (this) {
    MarketingPlatform.instagram =>
      'Analisis performa konten Instagram, Feed, Reels, Story, jangkauan, interaksi, dan waktu publikasi.',
    MarketingPlatform.metaAds =>
      'Evaluasi performa Meta Ads, biaya iklan, CTR, CPC, CPM, kualitas lead, booking, dan revenue.',
    MarketingPlatform.tiktokAds =>
      'Evaluasi performa TikTok Ads, biaya, tayangan, interaksi, konversi, dan kontribusi terhadap booking.',
    MarketingPlatform.googleAds =>
      'Evaluasi performa Google Ads, biaya, klik, konversi, kualitas lead, dan kontribusi terhadap pendapatan.',
    MarketingPlatform.googleAnalytics =>
      'Analisis traffic website, sumber pengunjung, perilaku pengguna, funnel, dan konversi.',
    MarketingPlatform.googleTagManager =>
      'Kelola tata kelola implementasi tag dan kesiapan pelacakan event pemasaran.',
  };

  IconData get icon => switch (this) {
    MarketingPlatform.instagram => Icons.camera_alt_outlined,
    MarketingPlatform.metaAds => Icons.campaign_outlined,
    MarketingPlatform.tiktokAds => Icons.video_library_outlined,
    MarketingPlatform.googleAds => Icons.ads_click_outlined,
    MarketingPlatform.googleAnalytics => Icons.analytics_outlined,
    MarketingPlatform.googleTagManager => Icons.sell_outlined,
  };

  List<String> get capabilities => switch (this) {
    MarketingPlatform.instagram => [
      'Analisis Feed, Reels, dan Story',
      'Engagement, reach, dan views',
      'Evaluasi performa konten',
      'Rekomendasi waktu publikasi',
      'Dukungan perencanaan copywriting',
    ],
    MarketingPlatform.metaAds => [
      'Spend, CPM, CPC, dan CTR',
      'Leads dan biaya per lead',
      'Evaluasi kualitas lead',
      'Analisis booking dan revenue',
      'Rekomendasi optimasi kampanye',
    ],
    MarketingPlatform.tiktokAds => [
      'Spend, impressions, dan clicks',
      'CTR, CPC, CPM, dan konversi',
      'Evaluasi performa materi iklan',
      'Analisis lead dan booking',
      'Rekomendasi optimasi kampanye',
    ],
    MarketingPlatform.googleAds => [
      'Spend, impressions, clicks',
      'CTR, CPC, dan conversion rate',
      'Cost per conversion',
      'Analisis kualitas lead',
      'Kontribusi booking dan revenue',
    ],
    MarketingPlatform.googleAnalytics => [
      'Traffic dan sumber pengunjung',
      'Landing page performance',
      'Conversion funnel',
      'Event dan conversion tracking',
      'Perilaku pengguna website',
    ],
    MarketingPlatform.googleTagManager => [
      'Inventaris tag dan trigger',
      'Pemeriksaan rancangan event',
      'Validasi rencana tracking',
      'Tata kelola perubahan tag',
      'Pemeriksaan kesiapan pengukuran',
    ],
  };

  String get route => switch (this) {
    MarketingPlatform.instagram => RoutePaths.instagramIntelligence,
    MarketingPlatform.metaAds => RoutePaths.metaAdsIntelligence,
    MarketingPlatform.tiktokAds => RoutePaths.tiktokIntelligence,
    MarketingPlatform.googleAds => RoutePaths.googleAdsIntelligence,
    MarketingPlatform.googleAnalytics => RoutePaths.googleAnalyticsIntelligence,
    MarketingPlatform.googleTagManager =>
      RoutePaths.googleTagManagerIntelligence,
  };

  bool get supportsSocialConnection =>
      this == MarketingPlatform.instagram ||
      this == MarketingPlatform.metaAds ||
      this == MarketingPlatform.tiktokAds;

  String get profileHint => switch (this) {
    MarketingPlatform.instagram => 'https://www.instagram.com/nama_akun/',
    MarketingPlatform.metaAds => 'https://www.facebook.com/nama_halaman/',
    MarketingPlatform.tiktokAds => 'https://www.tiktok.com/@nama_akun',
    _ => 'https://example.com/',
  };

  String get accountIdLabel => switch (this) {
    MarketingPlatform.instagram => 'Instagram Business Account ID (opsional)',
    MarketingPlatform.metaAds => 'Meta Ad Account ID (opsional)',
    MarketingPlatform.tiktokAds => 'TikTok Business Account ID (opsional)',
    _ => 'Account ID (opsional)',
  };
}

class SocialMediaIntelligencePage extends StatelessWidget {
  const SocialMediaIntelligencePage({super.key});

  @override
  Widget build(BuildContext context) => const _IntelligenceOverviewPage(
    title: 'Social Media Intelligence',
    subtitle: 'Pusat analisis performa media sosial dan periklanan digital.',
    platforms: [
      MarketingPlatform.instagram,
      MarketingPlatform.metaAds,
      MarketingPlatform.tiktokAds,
    ],
  );
}

class GoogleIntelligencePage extends StatelessWidget {
  const GoogleIntelligencePage({super.key});

  @override
  Widget build(BuildContext context) => const _IntelligenceOverviewPage(
    title: 'Google Intelligence',
    subtitle: 'Pusat pengukuran iklan, traffic website, dan tracking.',
    platforms: [
      MarketingPlatform.googleAds,
      MarketingPlatform.googleAnalytics,
      MarketingPlatform.googleTagManager,
    ],
  );
}

class MarketingPlatformPage extends StatelessWidget {
  const MarketingPlatformPage({required this.platform, super.key});

  final MarketingPlatform platform;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(platform.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PageHeader(
                  icon: platform.icon,
                  title: platform.title,
                  description: platform.description,
                ),
                const SizedBox(height: 24),
                if (platform.supportsSocialConnection) ...[
                  _PlatformConnectionForm(platform: platform),
                  const SizedBox(height: 24),
                ],
                const _ConnectionStatusCard(),
                const SizedBox(height: 24),
                Text(
                  'Kapabilitas yang direncanakan',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                ...platform.capabilities.map(
                  (capability) => _CapabilityTile(text: capability),
                ),
                const SizedBox(height: 24),
                const _GovernanceNotice(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlatformConnectionForm extends StatefulWidget {
  const _PlatformConnectionForm({required this.platform});

  final MarketingPlatform platform;

  @override
  State<_PlatformConnectionForm> createState() =>
      _PlatformConnectionFormState();
}

class _PlatformConnectionFormState extends State<_PlatformConnectionForm> {
  final _formKey = GlobalKey<FormState>();
  final _profileController = TextEditingController();
  final _accountIdController = TextEditingController();
  bool _validated = false;

  @override
  void dispose() {
    _profileController.dispose();
    _accountIdController.dispose();
    super.dispose();
  }

  bool _isValidHttpUrl(String value) {
    final uri = Uri.tryParse(value.trim());
    return uri != null &&
        (uri.scheme == 'https' || uri.scheme == 'http') &&
        uri.host.isNotEmpty &&
        !uri.host.contains(' ');
  }

  void _validateConfiguration() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    setState(() => _validated = true);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.link_outlined),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Konfigurasi Koneksi Platform',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Isi URL profil atau halaman bisnis. ID akun bersifat opsional dan dapat diperlukan saat menyiapkan integrasi resmi.',
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _profileController,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                  labelText: 'URL Profil / Halaman',
                  hintText: widget.platform.profileHint,
                  prefixIcon: const Icon(Icons.link),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  final input = value?.trim() ?? '';
                  if (input.isEmpty) {
                    return 'URL profil atau halaman wajib diisi.';
                  }
                  if (!_isValidHttpUrl(input)) {
                    return 'Masukkan URL lengkap yang valid (http:// atau https://).';
                  }
                  return null;
                },
                onChanged: (_) {
                  if (_validated) {
                    setState(() => _validated = false);
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _accountIdController,
                decoration: InputDecoration(
                  labelText: widget.platform.accountIdLabel,
                  hintText: 'Masukkan ID akun jika sudah tersedia',
                  prefixIcon: const Icon(Icons.badge_outlined),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.shield_outlined),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Jangan masukkan access token, API secret, password, atau client secret di sini. Kredensial harus ditangani backend melalui autentikasi resmi.',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Wrap(
                spacing: 12,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  FilledButton.icon(
                    onPressed: _validateConfiguration,
                    icon: const Icon(Icons.fact_check_outlined),
                    label: const Text('Validasi Konfigurasi'),
                  ),
                  if (_validated)
                    const Chip(
                      avatar: Icon(Icons.check_circle_outline, size: 18),
                      label: Text('Input valid — belum terhubung'),
                    ),
                ],
              ),
              if (_validated) ...[
                const SizedBox(height: 12),
                const Text(
                  'URL lolos validasi lokal. Konfigurasi belum disimpan ke backend; koneksi resmi masih menunggu implementasi OAuth/API.',
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _IntelligenceOverviewPage extends StatelessWidget {
  const _IntelligenceOverviewPage({
    required this.title,
    required this.subtitle,
    required this.platforms,
  });

  final String title;
  final String subtitle;
  final List<MarketingPlatform> platforms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 8),
                Text(subtitle, style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 24),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final columns = constraints.maxWidth >= 850
                        ? 3
                        : constraints.maxWidth >= 550
                        ? 2
                        : 1;
                    final cardWidth =
                        (constraints.maxWidth - (columns - 1) * 16) / columns;
                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: platforms
                          .map(
                            (platform) => SizedBox(
                              width: cardWidth,
                              child: _PlatformCard(platform: platform),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
                const SizedBox(height: 24),
                const _GovernanceNotice(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlatformCard extends StatelessWidget {
  const _PlatformCard({required this.platform});

  final MarketingPlatform platform;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(platform.icon, size: 32),
            const SizedBox(height: 16),
            Text(platform.title, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(platform.description, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => context.go(platform.route),
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Buka Intelligence'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 36),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConnectionStatusCard extends StatelessWidget {
  const _ConnectionStatusCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.link_off_outlined),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Integrasi belum dihubungkan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Halaman Intelligence tersedia sebagai kerangka awal. Data aktual memerlukan koneksi resmi, izin akses yang sesuai, dan validasi backend.',
            ),
            const SizedBox(height: 12),
            const Text('Status: menunggu konfigurasi integrasi'),
          ],
        ),
      ),
    );
  }
}

class _CapabilityTile extends StatelessWidget {
  const _CapabilityTile({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => ListTile(
    contentPadding: EdgeInsets.zero,
    leading: const Icon(Icons.check_circle_outline),
    title: Text(text),
  );
}

class _GovernanceNotice extends StatelessWidget {
  const _GovernanceNotice();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.verified_user_outlined),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'VENTRA Governance',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Rekomendasi AI harus menggunakan data yang tersedia, mematuhi aturan bisnis, dan melewati persetujuan sebelum tindakan yang berdampak pada kampanye dilakukan.',
            ),
          ],
        ),
      ),
    );
  }
}
