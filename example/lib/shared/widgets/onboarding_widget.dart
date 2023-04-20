import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const OnboardingWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = BatThemeData.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 54.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(height: 96.h),
          Text(
            title,
            style: theme.typography.headline3Medium
                .copyWith(color: theme.colors.primary),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: 263.w,
            child: Text(
              subtitle,
              style: theme.typography.bodyCopyMedium
                  .copyWith(color: theme.colors.tertiary.withOpacity(0.8)),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
