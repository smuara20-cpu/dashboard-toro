
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
  String get title {
    switch (this) {
      case MarketingPlatform.instagram:
        return 'Instagram Intelligence';
      case MarketingPlatform.metaAds:
        return 'Facebook Business / Meta Ads';
      case MarketingPlatform.tiktokAds:
        return 'TikTok Business Intelligence';
      case MarketingPlatform.googleAds:
        return 'Google Ads Intelligence';
      case MarketingPlatform.googleAnalytics:
        return 'Google Analytics Intelligence';
      case MarketingPlatform.googleTagManager:
        return 'Google Tag Manager';
    }
  }

  String get description {
    switch (this) {
      case MarketingPlatform.instagram:
        return 'Analisis performa konten Instagram, Feed, Reels, '
            'Story, jangkauan, interaksi, dan waktu publikasi.';
      case MarketingPlatform.metaAds:
        return 'Evaluasi performa Meta Ads, biaya iklan, CTR, CPC, '
            'CPM, kualitas lead, booking, dan revenue.';
      case MarketingPlatform.tiktokAds:
        return 'Evaluasi performa TikTok Ads, biaya, tayangan, '
            'interaksi, konversi, dan kontribusi terhadap booking.';
      case MarketingPlatform.googleAds:
        return 'Evaluasi performa Google Ads, biaya, klik, konversi, '
            'kualitas lead, dan kontribusi terhadap pendapatan.';
      case MarketingPlatform.googleAnalytics:
        return 'Analisis traffic website, sumber pengunjung, '
            'perilaku pengguna, funnel, dan konversi.';
      case MarketingPlatform.googleTagManager:
        return 'Kelola tata kelola implementasi tag dan kesiapan '
            'pelacakan event pemasaran.';
    }
  }

  IconData get icon {
    switch (this) {
      case MarketingPlatform.instagram:
        return Icons.camera_alt_outlined;
      case MarketingPlatform.metaAds:
        return Icons.campaign_outlined;
      case MarketingPlatform.tiktokAds:
        return Icons.video_library_outlined;
      case MarketingPlatform.googleAds:
        return Icons.ads_click_outlined;
      case MarketingPlatform.googleAnalytics:
        return Icons.analytics_outlined;
      case MarketingPlatform.googleTagManager:
        return Icons.sell_outlined;
    }
  }

  List<String> get capabilities {
    switch (this) {
      case MarketingPlatform.instagram:
        return [
          'Analisis Feed, Reels, dan Story',
          'Engagement, reach, dan views',
          'Evaluasi performa konten',
          'Rekomendasi waktu publikasi',
          'Dukungan perencanaan copywriting',
        ];
      case MarketingPlatform.metaAds:
        return [
          'Spend, CPM, CPC, dan CTR',
          'Leads dan biaya per lead',
          'Evaluasi kualitas lead',
          'Analisis booking dan revenue',
          'Rekomendasi optimasi kampanye',
        ];
      case MarketingPlatform.tiktokAds:
        return [
          'Spend, impressions, dan clicks',
          'CTR, CPC, CPM, dan konversi',
          'Evaluasi performa materi iklan',
          'Analisis lead dan booking',
          'Rekomendasi optimasi kampanye',
        ];
      case MarketingPlatform.googleAds:
        return [
          'Spend, impressions, clicks',
          'CTR, CPC, dan conversion rate',
          'Cost per conversion',
          'Analisis kualitas lead',
          'Kontribusi booking dan revenue',
        ];
      case MarketingPlatform.googleAnalytics:
        return [
          'Traffic dan sumber pengunjung',
          'Landing page performance',
          'Conversion funnel',
          'Event dan conversion tracking',
          'Perilaku pengguna website',
        ];
      case MarketingPlatform.googleTagManager:
        return [
          'Inventaris tag dan trigger',
          'Pemeriksaan rancangan event',
          'Validasi rencana tracking',
          'Tata kelola perubahan tag',
          'Pemeriksaan kesiapan pengukuran',
        ];
    }
  }

  String get route {
    switch (this) {
      case MarketingPlatform.instagram:
        return RoutePaths.instagramIntelligence;
      case MarketingPlatform.metaAds:
        return RoutePaths.metaAdsIntelligence;
      case MarketingPlatform.tiktokAds:
        return RoutePaths.tiktokIntelligence;
      case MarketingPlatform.googleAds:
        return RoutePaths.googleAdsIntelligence;
      case MarketingPlatform.googleAnalytics:
        return RoutePaths.googleAnalyticsIntelligence;
      case MarketingPlatform.googleTagManager:
        return RoutePaths.googleTagManagerIntelligence;
    }
  }
}

class SocialMediaIntelligencePage extends StatelessWidget {
  const SocialMediaIntelligencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _IntelligenceOverviewPage(
      title: 'Social Media Intelligence',
      subtitle:
      'Pusat analisis performa media sosial dan periklanan digital.',
      platforms: [
        MarketingPlatform.instagram,
        MarketingPlatform.metaAds,
        MarketingPlatform.tiktokAds,
      ],
    );
  }
}

class GoogleIntelligencePage extends StatelessWidget {
  const GoogleIntelligencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _IntelligenceOverviewPage(
      title: 'Google Intelligence',
      subtitle:
      'Pusat pengukuran iklan, traffic website, dan tracking.',
      platforms: [
        MarketingPlatform.googleAds,
        MarketingPlatform.googleAnalytics,
        MarketingPlatform.googleTagManager,
      ],
    );
  }
}

class MarketingPlatformPage extends StatelessWidget {
  const MarketingPlatformPage({
    required this.platform,
    super.key,
  });

  final MarketingPlatform platform;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(platform.title),
      ),
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
                _ConnectionStatusCard(platform: platform),
                const SizedBox(height: 24),
                Text(
                  'Kapabilitas yang direncanakan',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                ...platform.capabilities.map(
                      (capability) => _CapabilityTile(
                    text: capability,
                  ),
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
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final columns = constraints.maxWidth >= 850
                        ? 3
                        : constraints.maxWidth >= 550
                        ? 2
                        : 1;

                    final cardWidth =
                        (constraints.maxWidth - (columns - 1) * 16) /
                            columns;

                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: platforms.map((platform) {
                        return SizedBox(
                          width: cardWidth,
                          child: _PlatformCard(platform: platform),
                        );
                      }).toList(),
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
            Text(
              platform.title,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              platform.description,
              style: theme.textTheme.bodyMedium,
            ),
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
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
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
  const _ConnectionStatusCard({required this.platform});

  final MarketingPlatform platform;

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
            Text(
              'Halaman ${platform.title} sudah tersedia sebagai '
                  'kerangka awal. Data aktual memerlukan koneksi resmi, '
                  'izin akses yang sesuai, dan validasi backend.',
            ),
            const SizedBox(height: 12),
            const Text(
              'Status: menunggu konfigurasi integrasi',
            ),
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
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.check_circle_outline),
      title: Text(text),
    );
  }
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
              'Rekomendasi AI harus menggunakan data yang tersedia, '
                  'mematuhi aturan bisnis, dan melewati persetujuan '
                  'sebelum tindakan yang berdampak pada kampanye dilakukan.',
            ),
          ],
        ),
      ),
    );
  }
}
