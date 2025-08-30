import 'package:daily_list/core/constants/app_assets.dart';
import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:daily_list/features/splash/presentation/screens/pick_language_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui';
import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/app_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _backgroundController;
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _particleController;

  late Animation<double> _logoScale;
  late Animation<double> _logoRotation;
  late Animation<Offset> _logoSlide;
  late Animation<double> _textOpacity;
  late Animation<Offset> _textSlide;
  late Animation<double> _textScale;

  @override
  void initState() {
    super.initState();
    _backgroundController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    _logoController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _textController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _particleController = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat();

    _logoScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.6, curve: Curves.elasticOut),
      ),
    );

    _logoRotation = Tween<double>(begin: -0.5, end: 0.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOutBack),
      ),
    );

    _logoSlide = Tween<Offset>(begin: const Offset(0, -2), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _logoController,
            curve: const Interval(0.2, 1.0, curve: Curves.elasticOut),
          ),
        );

    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeIn),
      ),
    );

    _textSlide = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _textController,
            curve: const Interval(0.0, 0.8, curve: Curves.elasticOut),
          ),
        );

    _textScale = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.2, 1.0, curve: Curves.elasticOut),
      ),
    );

    _logoController.forward().then((_) {
      _textController.forward().then((_) {
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PickLanguageScreen()),
            );
          }
        });
      });
    });
  }

  @override
  void dispose() {
    _backgroundController.dispose();
    _logoController.dispose();
    _textController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _backgroundController,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topLeft,
                radius: 2,
                colors: [
                  Color.lerp(
                    AppColors.primary400,
                    AppColors.natural100,
                    _backgroundController.value,
                  )!,
                  Color.lerp(
                    AppColors.natural100,
                    AppColors.lightSkyBlue200,
                    _backgroundController.value,
                  )!,
                ],
                stops: const [0.5, 1],
              ),
            ),
            child: Stack(
              children: [
                ...List.generate(12, (index) => _buildParticle(index)),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: _logoController,
                        builder: (context, child) {
                          return SlideTransition(
                            position: _logoSlide,
                            child: Transform.rotate(
                              angle: _logoRotation.value * math.pi,
                              child: Transform.scale(
                                scale: _logoScale.value,
                                child: Image.asset(
                                  AppAssets.logo,
                                  width: 84,
                                  height: 82,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      24.g,
                      AnimatedBuilder(
                        animation: _textController,
                        builder: (context, child) {
                          return SlideTransition(
                            position: _textSlide,
                            child: Transform.scale(
                              scale: _textScale.value,
                              child: FadeTransition(
                                opacity: _textOpacity,
                                child: AppText(
                                  isLocalizedKey: false,
                                  text: 'Daily List',
                                  fontSize: 28,
                                  fontWeight: 700,
                                  color: Colors.white.withValues(alpha: 0.95),
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      24.g,
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildParticle(int index) {
    final double size = 4 + (index % 3) * 2;
    final double speedMultiplier = 0.5 + (index % 4) * 0.3;

    return AnimatedBuilder(
      animation: _particleController,
      builder: (context, child) {
        final double progress =
            (_particleController.value * speedMultiplier) % 1.0;
        final double opacity = (1 - progress).clamp(0.0, 0.4);

        return Positioned(
          left:
              (index % 7) * MediaQuery.of(context).size.width / 6 +
              math.sin(progress * 2 * math.pi + index) * 30,
          top:
              MediaQuery.of(context).size.height * progress +
              math.cos(progress * 2 * math.pi + index) * 20,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: opacity),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withValues(alpha: opacity * 0.5),
                  blurRadius: size / 2,
                  spreadRadius: size / 4,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
