import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedCircularProgress extends StatefulWidget {
  const AnimatedCircularProgress({
    super.key,
    this.size = 60.0,
    this.strokeWidth = 4.0,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
    this.duration = const Duration(seconds: 2),
    this.dotSize = 8.0,
    this.showDot = true,
    this.animationType = AnimationType.smooth,
  });

  final double size;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;
  final Duration duration;
  final double dotSize;
  final bool showDot;
  final AnimationType animationType;

  @override
  State<AnimatedCircularProgress> createState() =>
      _AnimatedCircularProgressState();
}

enum AnimationType { smooth, bounce, elastic }

class _AnimatedCircularProgressState extends State<AnimatedCircularProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duration, vsync: this);

    Curve curve;
    switch (widget.animationType) {
      case AnimationType.bounce:
        curve = Curves.bounceInOut;
        break;
      case AnimationType.elastic:
        curve = Curves.elasticInOut;
        break;
      case AnimationType.smooth:
        curve = Curves.linear;
        break;
    }

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: curve));

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CustomPaint(
            painter: CircularProgressPainter(
              progress: _animation.value,
              strokeWidth: widget.strokeWidth,
              backgroundColor: widget.backgroundColor,
              progressColor: widget.progressColor,
              dotSize: widget.dotSize,
              showDot: widget.showDot,
            ),
            size: Size(widget.size, widget.size),
          );
        },
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;
  final double dotSize;
  final bool showDot;

  CircularProgressPainter({
    required this.progress,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.progressColor,
    required this.dotSize,
    required this.showDot,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final backgroundPaint = Paint()
      ..color = backgroundColor.withOpacity(0.3)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    _drawDashedCircle(canvas, center, radius, backgroundPaint);

    const double progressArc = 3 * math.pi / 2;
    final double startAngle = -math.pi / 2 + (progress * 2 * math.pi);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      progressArc,
      false,
      progressPaint,
    );

    if (showDot) {
      final double dotAngle = startAngle + progressArc;
      final double dotX = center.dx + radius * math.cos(dotAngle);
      final double dotY = center.dy + radius * math.sin(dotAngle);

      final dotPaint = Paint()
        ..color = progressColor
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(dotX, dotY), dotSize / 2, dotPaint);
    }
  }

  void _drawDashedCircle(
    Canvas canvas,
    Offset center,
    double radius,
    Paint paint,
  ) {
    const int dashCount = 5;
    const double dashLength = 2 * math.pi / dashCount;
    const double gapLength = dashLength * 0.6;

    for (int i = 0; i < dashCount; i++) {
      final double startAngle = i * (dashLength + gapLength);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        dashLength,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
