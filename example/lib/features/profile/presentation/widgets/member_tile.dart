import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberTile extends StatelessWidget {
  final String name;
  const MemberTile({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = BatThemeData.of(context);
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: theme.colors.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/profile.png',
                width: 32.w,
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: theme.typography.subtitleMedium
                        .copyWith(color: theme.colors.tertiary),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    'Guest',
                    style: theme.typography.subtitle.copyWith(
                        color: theme.colors.tertiary.withOpacity(0.6)),
                  )
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$name\'s Iphone',
                style: theme.typography.subtitleMedium
                    .copyWith(color: theme.colors.tertiary),
              ),
              Text(
                '192.168.137.19',
                style: theme.typography.subtitle
                    .copyWith(color: theme.colors.tertiary.withOpacity(0.6)),
              )
            ],
          )
        ],
      ),
    );
  }
}
