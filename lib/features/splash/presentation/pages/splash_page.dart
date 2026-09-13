import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_paths.dart';
import '../ventra_animated_logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  void _openOnboarding(BuildContext context) {
    if (context.mounted) {
      context.go(RoutePaths.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: VentraAnimatedLogo(
              onCompleted: () => _openOnboarding(context),
            ),
          ),
        ),
      ),
    );
  }
}
