import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/res/res.dart';

class MemberTile extends StatelessWidget {
  final String name;
  const MemberTile({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: SmartyColors.secondary10,
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
                    style: TextStyles.subtitle.copyWith(
                        color: SmartyColors.grey, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    'Guest',
                    style: TextStyles.subtitle
                        .copyWith(color: SmartyColors.grey60),
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
                style: TextStyles.subtitle.copyWith(color: SmartyColors.grey),
              ),
              Text(
                '192.168.137.19',
                style: TextStyles.subtitle.copyWith(color: SmartyColors.grey60),
              )
            ],
          )
        ],
      ),
    );
  }
}
