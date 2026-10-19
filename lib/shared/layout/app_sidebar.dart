import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router/route_paths.dart';

class AppSidebar extends StatefulWidget {
  const AppSidebar({super.key});

  @override
  State<AppSidebar> createState() => _AppSidebarState();
}

class _AppSidebarState extends State<AppSidebar> {
  static const Color _navy = Color(0xFF0B1F3A);
  static const Color _navyDark = Color(0xFF081629);
  static const Color _teal = Color(0xFF087F8C);
  static const Color _activeBackground = Color(0xFF123D49);

  bool _socialExpanded = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currentRoute = GoRouterState.of(context).matchedLocation;

    final socialRoutes = <String>[
      RoutePaths.socialIntelligence,
      RoutePaths.instagramIntelligence,
      RoutePaths.metaAdsIntelligence,
      RoutePaths.tiktokIntelligence,
    ];

    final socialActive = socialRoutes.any(
      (route) => currentRoute == route || currentRoute.startsWith('$route/'),
    );

    final socialExpanded = _socialExpanded || socialActive;

    return Container(
      width: 250,
      color: isDark ? _navyDark : _navy,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildBrand(),
          const Divider(color: Color(0x33FFFFFF), height: 1),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(10, 18, 10, 24),
              children: [
                _sectionLabel('UTAMA'),
                _item(
                  context,
                  icon: Icons.dashboard_outlined,
                  label: 'Dashboard',
                  route: RoutePaths.dashboard,
                  currentRoute: currentRoute,
                ),
                const SizedBox(height: 20),

                _sectionLabel('OPERASIONAL'),
                _item(
                  context,
                  icon: Icons.calendar_month_outlined,
                  label: 'Booking',
                  route: RoutePaths.booking,
                  currentRoute: currentRoute,
                ),
                _item(
                  context,
                  icon: Icons.groups_outlined,
                  label: 'Jamaah',
                  route: RoutePaths.jamaah,
                  currentRoute: currentRoute,
                ),
                _item(
                  context,
                  icon: Icons.card_travel_outlined,
                  label: 'Paket Wisata',
                  currentRoute: currentRoute,
                ),
                _item(
                  context,
                  icon: Icons.flight_takeoff_outlined,
                  label: 'Visa & Dokumen',
                  currentRoute: currentRoute,
                ),
                _item(
                  context,
                  icon: Icons.hotel_outlined,
                  label: 'Hotel & Akomodasi',
                  currentRoute: currentRoute,
                ),
                _item(
                  context,
                  icon: Icons.handshake_outlined,
                  label: 'Mitra & Vendor',
                  currentRoute: currentRoute,
                ),
                const SizedBox(height: 20),

                _sectionLabel('KEUANGAN'),
                _item(
                  context,
                  icon: Icons.account_balance_wallet_outlined,
                  label: 'Pembayaran',
                  route: RoutePaths.finance,
                  currentRoute: currentRoute,
                ),
                _item(
                  context,
                  icon: Icons.receipt_long_outlined,
                  label: 'Invoice',
                  currentRoute: currentRoute,
                ),
                _item(
                  context,
                  icon: Icons.payments_outlined,
                  label: 'Pengeluaran',
                  currentRoute: currentRoute,
                ),
                const SizedBox(height: 20),

                _sectionLabel('MARKETING & CRM'),
                _item(
                  context,
                  icon: Icons.people_alt_outlined,
                  label: 'CRM & Lead Intelligence',
                  currentRoute: currentRoute,
                ),
                _item(
                  context,
                  icon: Icons.campaign_outlined,
                  label: 'Campaign & Ads',
                  currentRoute: currentRoute,
                ),
                _item(
                  context,
                  icon: Icons.travel_explore_outlined,
                  label: 'Modern SEO Intelligence',
                  currentRoute: currentRoute,
                ),
                const SizedBox(height: 20),

                _sectionLabel('AI & GOVERNANCE'),
                _item(
                  context,
                  icon: Icons.psychology_outlined,
                  label: 'VENTRA AI Agents',
                  currentRoute: currentRoute,
                ),

                _socialMenu(
                  currentRoute: currentRoute,
                  expanded: socialExpanded,
                  active: socialActive,
                ),

                if (socialExpanded) ...[
                  _subItem(
                    context,
                    icon: Icons.camera_alt_outlined,
                    label: 'Instagram',
                    route: RoutePaths.instagramIntelligence,
                    currentRoute: currentRoute,
                  ),
                  _subItem(
                    context,
                    icon: Icons.campaign_outlined,
                    label: 'Facebook Business / Meta Ads',
                    route: RoutePaths.metaAdsIntelligence,
                    currentRoute: currentRoute,
                  ),
                  _subItem(
                    context,
                    icon: Icons.video_library_outlined,
                    label: 'TikTok Business',
                    route: RoutePaths.tiktokIntelligence,
                    currentRoute: currentRoute,
                  ),
                ],

                _item(
                  context,
                  icon: Icons.query_stats_outlined,
                  label: 'Google Intelligence',
                  route: RoutePaths.googleIntelligence,
                  currentRoute: currentRoute,
                ),
                _item(
                  context,
                  icon: Icons.ads_click_outlined,
                  label: 'Google Ads',
                  route: RoutePaths.googleAdsIntelligence,
                  currentRoute: currentRoute,
                ),
                _item(
                  context,
                  icon: Icons.analytics_outlined,
                  label: 'Google Analytics',
                  route: RoutePaths.googleAnalyticsIntelligence,
                  currentRoute: currentRoute,
                ),
                _item(
                  context,
                  icon: Icons.sell_outlined,
                  label: 'Google Tag Manager',
                  route: RoutePaths.googleTagManagerIntelligence,
                  currentRoute: currentRoute,
                ),
                _item(
                  context,
                  icon: Icons.chat_outlined,
                  label: 'WhatsApp Intelligence',
                  currentRoute: currentRoute,
                ),
                _item(
                  context,
                  icon: Icons.fact_check_outlined,
                  label: 'Audit & Akses',
                  currentRoute: currentRoute,
                ),
                _item(
                  context,
                  icon: Icons.settings_outlined,
                  label: 'Pengaturan',
                  currentRoute: currentRoute,
                ),
                const SizedBox(height: 20),

                _sectionLabel('LAINNYA'),
                _item(
                  context,
                  icon: Icons.star_outline,
                  label: 'Testimonial',
                  route: RoutePaths.testimonial,
                  currentRoute: currentRoute,
                ),
              ],
            ),
          ),
          const Divider(color: Color(0x33FFFFFF), height: 1),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFF63D6A3),
                    shape: BoxShape.circle,
                  ),
                  child: SizedBox(width: 8, height: 8),
                ),
                SizedBox(width: 9),
                Expanded(
                  child: Text(
                    'VENTRA Enterprise',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialMenu({
    required String? currentRoute,
    required bool expanded,
    required bool active,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Material(
        color: active ? _activeBackground : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () => setState(() {
            _socialExpanded = !_socialExpanded;
          }),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
            child: Row(
              children: [
                Icon(
                  Icons.share_outlined,
                  size: 19,
                  color: active ? const Color(0xFF69D5C5) : Colors.white70,
                ),
                const SizedBox(width: 11),
                const Expanded(
                  child: Text(
                    'Social Media Intelligence',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  expanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.white70,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _subItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String route,
    required String? currentRoute,
  }) {
    final selected =
        currentRoute == route || (currentRoute?.startsWith('$route/') ?? false);

    return Padding(
      padding: const EdgeInsets.only(left: 14, bottom: 3),
      child: Material(
        color: selected ? _activeBackground : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () => context.go(route),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 17,
                  color: selected ? const Color(0xFF69D5C5) : Colors.white70,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: selected ? Colors.white : Colors.white70,
                      fontSize: 11,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ),
                if (selected)
                  Container(
                    width: 3,
                    height: 18,
                    decoration: BoxDecoration(
                      color: const Color(0xFF69D5C5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrand() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(20, 26, 16, 24),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: _teal,
              borderRadius: BorderRadius.all(Radius.circular(11)),
            ),
            child: SizedBox(
              width: 38,
              height: 38,
              child: Icon(Icons.layers_outlined, color: Colors.white, size: 23),
            ),
          ),
          SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'VENTRA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'TRAVEL INTELLIGENCE',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 8,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 8, 9),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF8EA3BB),
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.15,
        ),
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String? currentRoute,
    String? route,
  }) {
    final enabled = route != null;
    final selected =
        enabled &&
        currentRoute != null &&
        (currentRoute == route || currentRoute.startsWith('$route/'));

    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Material(
        color: selected ? _activeBackground : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: route == null ? null : () => context.go(route),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 19,
                  color: selected
                      ? const Color(0xFF69D5C5)
                      : enabled
                      ? Colors.white70
                      : Colors.white38,
                ),
                const SizedBox(width: 11),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: selected
                          ? Colors.white
                          : enabled
                          ? Colors.white70
                          : Colors.white38,
                      fontSize: 12,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ),
                if (selected)
                  Container(
                    width: 3,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color(0xFF69D5C5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
