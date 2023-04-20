import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/painter.dart';
import '../widgets/voice_tile.dart';

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
    var theme = BatThemeData.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 32.h + MediaQuery.of(context).padding.top),
          Text(
            'Voice',
            style: theme.typography.headline4,
          ),
          SizedBox(height: 32.h),
          VoiceTile(
            name: 'Siri',
            onChanged: (bool v) {},
            value: true,
          ),
          SizedBox(height: 24.h),
          VoiceTile(
            name: 'Google Assistant',
            onChanged: (bool v) {},
            value: false,
          ),
          SizedBox(height: 200.h),
          CustomPaint(
            painter: SpritePainter(_controller, theme.colors.primary),
            child: Icon(Icons.keyboard_voice_rounded,
                color: BatPalette.white, size: 76.w),
          ),
          const Spacer(),
          Text(
            "Listening${_controller.value > 2 / 3 ? '...' : _controller.value > 1 / 3 ? '..' : '.'}",
            style: theme.typography.headline4
                .copyWith(color: theme.colors.tertiary),
          ),
        ],
      ),
    );
  }
}
