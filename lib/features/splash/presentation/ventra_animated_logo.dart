import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Premium VENTRA splash logo animation.
///
/// Timeline:
/// 0.00–0.40s  light particles
/// 0.35–0.85s  logo reveal
/// 0.85–1.60s  logo/orbit glow emphasis
/// 1.60–2.20s  wordmark reveal
/// 2.20–2.80s  final hold
class VentraAnimatedLogo extends StatefulWidget {
  const VentraAnimatedLogo({
    super.key,
    this.onCompleted,
  });

  final VoidCallback? onCompleted;

  static const duration = Duration(milliseconds: 2800);

  @override
  State<VentraAnimatedLogo> createState() => _VentraAnimatedLogoState();
}

class _VentraAnimatedLogoState extends State<VentraAnimatedLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: VentraAnimatedLogo.duration,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onCompleted?.call();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _interval(double start, double end) {
    return Curves.easeOutCubic.transform(
      Interval(start, end).transform(_controller.value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final particles = _interval(0.0, 0.22);
        final logoOpacity = _interval(0.12, 0.38);
        final logoScale = 0.86 + (0.14 * _interval(0.12, 0.38));
        final glow = _interval(0.28, 0.58);
        final textOpacity = _interval(0.55, 0.79);
        final finalGlow = _interval(0.79, 1.0);

        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(
                  painter: _VentraParticlePainter(progress: particles),
                ),
              ),
            ),
            Transform.scale(
              scale: logoScale,
              child: Opacity(
                opacity: logoOpacity,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF00B4FF).withValues(
                          alpha: 0.10 + (0.16 * glow),
                        ),
                        blurRadius: 28 + (18 * glow),
                        spreadRadius: 2,
                      ),
                      BoxShadow(
                        color: const Color(0xFFD4AF37).withValues(
                          alpha: 0.05 + (0.10 * glow),
                        ),
                        blurRadius: 42,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/branding/ventra_logo.png',
                    width: 330,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
            IgnorePointer(
              child: Opacity(
                opacity: finalGlow,
                child: Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xFFFFFFFF).withValues(alpha: 0.10),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            IgnorePointer(
              child: Align(
                alignment: Alignment.center,
                child: Opacity(
                  opacity: textOpacity * 0.18,
                  child: Container(
                    width: 280,
                    height: 3,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.transparent,
                          Color(0xFFD4AF37),
                          Colors.transparent,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _VentraParticlePainter extends CustomPainter {
  _VentraParticlePainter({
    required this.progress,
  });

  final double progress;

  static const _particleCount = 34;

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;

    final center = Offset(size.width / 2, size.height / 2);
    final radiusBase = math.min(size.width, size.height) * 0.34;

    for (var i = 0; i < _particleCount; i++) {
      final seed = i * 17.371;
      final angle = (seed % (math.pi * 2)) + (progress * 1.7);
      final radiusFactor = 0.45 + ((seed % 100) / 100) * 0.65;
      final radius = radiusBase * radiusFactor * (1.0 - progress * 0.42);

      final x = center.dx + math.cos(angle) * radius;
      final y = center.dy + math.sin(angle) * radius * 0.72;

      final fade = (1.0 - ((progress - 0.55).clamp(0.0, 1.0) * 1.5))
          .clamp(0.0, 1.0);
      final sizeFactor = 0.8 + ((seed % 7) / 7) * 1.8;

      final paint = Paint()
        ..color = const Color(0xFF00B4FF).withValues(
          alpha: 0.12 + (0.55 * progress * fade),
        )
        ..maskFilter = MaskFilter.blur(
          BlurStyle.normal,
          1.5 * sizeFactor,
        );

      canvas.drawCircle(
        Offset(x, y),
        sizeFactor,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _VentraParticlePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
