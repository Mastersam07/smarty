import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({
    Key? key,
    required this.count,
    required this.value,
    this.size = 24,
    this.spacing = 16,
  }) : super(key: key);

  final int count;
  final int value;
  final double size;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    var theme = BatThemeData.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: AnimatedContainer(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 500),
            width: index == value ? (size * 1.5).w : size.w,
            height: 12.h,
            decoration: BoxDecoration(
              color: index == value
                  ? theme.colors.primary
                  : theme.colors.tertiary.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        ),
      ),
    );
  }
}
