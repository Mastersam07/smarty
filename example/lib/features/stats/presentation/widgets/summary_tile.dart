import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/res/res.dart';

class SummaryTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget icon;
  const SummaryTile(
      {Key? key,
      required this.icon,
      required this.subTitle,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = BatThemeData.of(context);
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: theme.colors.primary,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24.r,
            backgroundColor: BatPalette.secondary60,
            child: icon,
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.headline4.copyWith(
                    color: BatPalette.white, fontWeight: FontWeight.w500),
              ),
              Text(
                subTitle,
                style: TextStyles.body.copyWith(
                  color: BatPalette.white60,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
