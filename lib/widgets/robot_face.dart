import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class RobotFace extends StatefulWidget {
  final double size;
  final bool listening;
  final bool paused;

  const RobotFace({
    super.key,
    required this.size,
    required this.listening,
    required this.paused,
  });

  @override
  State<RobotFace> createState() => _RobotFaceState();
}

class _RobotFaceState extends State<RobotFace>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size;

    return AnimatedBuilder(
      animation: _ctrl,
      builder: (context, _) {
        final t = _ctrl.value;
        final pulse = (math.sin(t * 2 * math.pi) + 1) / 2;

        double blink = 1.0;
        if (t > 0.90 && t < 0.96) {
          blink =
              (1 - math.sin((t - 0.90) / 0.06 * math.pi)).clamp(0.08, 1.0);
        }

        double glow;
        Color eyeColor;
        if (widget.paused) {
          glow = 0.18;
          eyeColor = const Color(0xFF4A6B8A);
        } else if (widget.listening) {
          glow = 0.95 + pulse * 0.05;
          eyeColor = AppColors.primaryGlow;
        } else {
          glow = 0.60 + pulse * 0.20;
          eyeColor = AppColors.primaryGlow;
        }

        return SizedBox(
          width: size * 1.15,
          height: size * 1.15,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: size * 0.95,
                height: size * 0.95,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: (widget.paused
                              ? AppColors.textMuted
                              : AppColors.primary)
                          .withOpacity(0.10 * glow),
                      blurRadius: size * 0.35,
                      spreadRadius: size * 0.05,
                    ),
                  ],
                ),
              ),
              Container(
                width: size,
                height: size * 1.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size * 0.32),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF3B4762),
                      Color(0xFF1B2436),
                      Color(0xFF0A0F1A),
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      blurRadius: 40,
                      offset: const Offset(0, 20),
                    ),
                    BoxShadow(
                      color: const Color(0xFF6C88B8).withOpacity(0.18),
                      blurRadius: 1,
                      offset: const Offset(-2, -2),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: size * 0.04,
                      left: size * 0.14,
                      right: size * 0.14,
                      height: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.0),
                              Colors.white.withOpacity(0.35),
                              Colors.white.withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: size * 0.80,
                        height: size * 0.70,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(size * 0.26),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF050A14),
                              Color(0xFF0B1220),
                            ],
                          ),
                          border: Border.all(
                            color: const Color(0xFF101A30),
                            width: 1.4,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _Eye(
                                size: size * 0.13,
                                glow: glow,
                                color: eyeColor,
                                blink: blink,
                              ),
                              SizedBox(width: size * 0.20),
                              _Eye(
                                size: size * 0.13,
                                glow: glow,
                                color: eyeColor,
                                blink: blink,
                              ),
                            ],
                          ),
                          SizedBox(height: size * 0.14),
                          Container(
                            width: size * 0.20,
                            height: size * 0.018,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: (widget.paused
                                      ? AppColors.textMuted
                                      : AppColors.primary)
                                  .withOpacity(0.55 * glow),
                              boxShadow: [
                                BoxShadow(
                                  color: (widget.paused
                                          ? AppColors.textMuted
                                          : AppColors.primary)
                                      .withOpacity(0.40 * glow),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Eye extends StatelessWidget {
  final double size;
  final double glow;
  final Color color;
  final double blink;

  const _Eye({
    required this.size,
    required this.glow,
    required this.color,
    required this.blink,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleY: blink,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              Colors.white,
              color,
              color.withOpacity(0.7),
            ],
            stops: const [0.0, 0.45, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.85 * glow),
              blurRadius: 18,
              spreadRadius: 3,
            ),
            BoxShadow(
              color: color.withOpacity(0.45 * glow),
              blurRadius: 40,
              spreadRadius: 8,
            ),
          ],
        ),
      ),
    );
  }
}
