import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/enums.dart';

import '../../../devices/domain/models/devices.dart';

class StatTile extends StatelessWidget {
  final Device device;
  const StatTile({
    Key? key,
    required this.device,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = BatThemeData.of(context);
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
              color: theme.colors.tertiary.withOpacity(0.6),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device.name!,
                  style: theme.typography.bodyCopyMedium.copyWith(
                    color: theme.colors.tertiary,
                  ),
                ),
                Text(
                  'Living Room',
                  style: theme.typography.subtitle.copyWith(
                    color: theme.colors.tertiary.withOpacity(0.6),
                  ),
                )
              ],
            ),
          ],
        ),
        Text(
          '250KWh',
          style: theme.typography.subtitle.copyWith(
            color: theme.colors.tertiary.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
