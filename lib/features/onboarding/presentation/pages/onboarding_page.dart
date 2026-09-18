import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dashboard_kpi/app/router/route_paths.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  static const _pages = <_OnboardingData>[
    _OnboardingData(
      title: 'Welcome to VENTRA',
      description:
          'The AI-Powered Travel Operating System untuk mengelola bisnis perjalanan secara lebih cerdas, terintegrasi, dan profesional.',
      icon: Icons.flight_takeoff_rounded,
    ),
    _OnboardingData(
      title: 'Manage Your Travel Business',
      description:
          'Kelola booking, jamaah, finance, operasional, dan aktivitas travel dalam satu platform yang terintegrasi.',
      icon: Icons.dashboard_customize_rounded,
    ),
    _OnboardingData(
      title: 'AI-Powered Travel Intelligence',
      description:
          'Manfaatkan AI Agent, WhatsApp Intelligence, dan operational intelligence untuk membantu tim bekerja lebih cepat dan efektif.',
      icon: Icons.auto_awesome_rounded,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOutCubic,
      );
      return;
    }

    context.go(RoutePaths.login);
  }

  void _skip() {
    _pageController.animateToPage(
      _pages.length - 1,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),
      body: SafeArea(
        child: Column(
          children: [
            // ============================================================
            // HEADER
            // ============================================================
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 18, 24, 8),
              child: SizedBox(
                height: 68,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Official VENTRA logo.
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 170,
                          height: 64,
                          child: Image.asset(
                            'assets/images/branding/ventra_logo.png',
                            fit: BoxFit.contain,
                            alignment: Alignment.centerLeft,
                            filterQuality: FilterQuality.high,
                            errorBuilder: (context, error, stackTrace) {
                              return const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'VENTRA',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2.2,
                                    color: Color(0xFF082B68),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    if (_currentPage < _pages.length - 1)
                      TextButton(
                        onPressed: _skip,
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF627D98),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // ============================================================
            // ONBOARDING CONTENT
            // ============================================================
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ------------------------------------------------
                        // Visual
                        // ------------------------------------------------
                        Container(
                          width: size.width * 0.55,
                          height: size.width * 0.55,
                          constraints: const BoxConstraints(
                            minWidth: 190,
                            minHeight: 190,
                            maxWidth: 260,
                            maxHeight: 260,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const RadialGradient(
                              colors: [Color(0xFFEAF7FF), Color(0xFFF8FAFD)],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(
                                  0xFF008CFF,
                                ).withValues(alpha: 0.10),
                                blurRadius: 40,
                                spreadRadius: 4,
                              ),
                              BoxShadow(
                                color: const Color(
                                  0xFFD4AF37,
                                ).withValues(alpha: 0.06),
                                blurRadius: 55,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Icon(
                            page.icon,
                            size: 92,
                            color: const Color(0xFF087FC9),
                          ),
                        ),

                        const SizedBox(height: 44),

                        // ------------------------------------------------
                        // Title
                        // ------------------------------------------------
                        Text(
                          page.title,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF102A43),
                            letterSpacing: -0.4,
                            height: 1.2,
                          ),
                        ),

                        const SizedBox(height: 18),

                        // ------------------------------------------------
                        // Description
                        // ------------------------------------------------
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 520),
                          child: Text(
                            page.description,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              height: 1.6,
                              fontSize: 16,
                              color: const Color(0xFF627D98),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // ============================================================
            // BOTTOM CONTROL
            // ============================================================
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 8, 28, 28),
              child: Column(
                children: [
                  // Page indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_pages.length, (index) {
                      final isActive = _currentPage == index;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOut,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: isActive ? 28 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: isActive
                              ? const Color(0xFFD4AF37)
                              : const Color(0xFFD9E2EC),
                          borderRadius: BorderRadius.circular(99),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 24),

                  // Main CTA
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF087FC9),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        _currentPage == _pages.length - 1
                            ? 'Get Started'
                            : 'Continue',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingData {
  const _OnboardingData({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}
