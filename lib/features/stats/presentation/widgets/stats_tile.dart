import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/enums.dart';

import '../../../../shared/res/res.dart';
import '../../../devices/domain/models/devices.dart';

class StatTile extends StatelessWidget {
  final Device device;
  const StatTile({
    Key? key,
    required this.device,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              device.type.icon!,
              width: 20.w,
              height: 20.h,
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device.name!,
                  style: TextStyles.body
                      .copyWith(color: SmartyColors.grey, height: 1.0),
                ),
                Text(
                  'Living Room',
                  style: TextStyles.subtitle.copyWith(
                    color: SmartyColors.grey60,
                  ),
                )
              ],
            ),
          ],
        ),
        Text(
          '250KWh',
          style: TextStyles.subtitle.copyWith(
            color: SmartyColors.grey60,
          ),
        ),
      ],
    );
  }
}
