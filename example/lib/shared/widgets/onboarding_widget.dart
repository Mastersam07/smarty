import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/res.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 54.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(height: 96.h),
          Text(
            title,
            style: TextStyles.headline3.copyWith(
                color: SmartyColors.primary, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: 263.w,
            child: Text(
              subtitle,
              style: BatThemeData.of(context).typography.bodyCopyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
