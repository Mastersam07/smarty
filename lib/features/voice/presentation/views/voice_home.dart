import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../res/res.dart';

class VoiceHomeScreen extends StatefulWidget {
  const VoiceHomeScreen({Key? key}) : super(key: key);

  @override
  State<VoiceHomeScreen> createState() => _VoiceHomeScreenState();
}

class _VoiceHomeScreenState extends State<VoiceHomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller
      ..stop()
      ..reset()
      ..repeat(period: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 32 + MediaQuery.of(context).padding.top),
          Text(
            'Voice',
            style: TextStyles.headline4,
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: SmartyColors.grey10,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Siri',
                  style:
                      TextStyles.headline4.copyWith(color: SmartyColors.grey80),
                ),
                Switch.adaptive(
                  value: false,
                  onChanged: (bool v) {},
                  activeColor: SmartyColors.primary,
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: SmartyColors.grey10,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Google Assistant',
                  style:
                      TextStyles.headline4.copyWith(color: SmartyColors.grey80),
                ),
                Switch.adaptive(
                  value: true,
                  onChanged: (bool v) {},
                  activeColor: SmartyColors.primary,
                )
              ],
            ),
          ),
          const SizedBox(height: 200),
          CustomPaint(
            painter: SpritePainter(_controller, SmartyColors.primary),
            child: Icon(Icons.keyboard_voice_rounded,
                color: SmartyColors.tertiary, size: 76),
          ),
          const Spacer(),
          Text(
            "Listening${_controller.value > 2 / 3 ? '...' : _controller.value > 1 / 3 ? '..' : '.'}",
            style: TextStyles.headline4.copyWith(color: SmartyColors.grey80),
          ),
          const SizedBox(height: 37),
        ],
      ),
    );
  }
}

class SpritePainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _color;

  SpritePainter(this._animation, this._color) : super(repaint: _animation);

  void circle(Canvas canvas, Rect rect, double value) {
    double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    Color color = _color.withOpacity(opacity);

    double size = rect.width;
    double area = size * size;
    double radius = sqrt(area * value);

    final Paint paint = Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(SpritePainter oldDelegate) {
    return true;
  }
}
