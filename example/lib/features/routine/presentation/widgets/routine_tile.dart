import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/res/res.dart';

class RoutineTile extends StatelessWidget {
  final String name;
  final bool active;
  const RoutineTile({
    Key? key,
    required this.name,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: active ? SmartyColors.primary : SmartyColors.grey10,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.sunny,
                size: 24.w,
                color: active ? SmartyColors.tertiary : SmartyColors.grey60,
              ),
              SizedBox(width: 4.w),
              Text(
                name,
                style: TextStyles.body.copyWith(
                    color:
                        active ? SmartyColors.tertiary : SmartyColors.grey60),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '6:00 AM',
                style: TextStyles.subtitle.copyWith(
                    color:
                        active ? SmartyColors.tertiary80 : SmartyColors.grey60),
              ),
              Text(
                '5 Devices',
                style: TextStyles.subtitle.copyWith(
                    color:
                        active ? SmartyColors.tertiary80 : SmartyColors.grey60),
              ),
            ],
          )
        ],
      ),
    );
  }
}
