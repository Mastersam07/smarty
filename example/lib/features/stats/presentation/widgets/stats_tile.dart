import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smarty/main.dart';
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
    var theme = context.read<ThemeProvider>();
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
              color: theme.isDark ? BatPalette.white60 : BatPalette.grey60,
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device.name!,
                  style: BatThemeData.of(context).typography.bodyCopyMedium,
                ),
                Text(
                  'Living Room',
                  style: BatThemeData.of(context).typography.subtitle.copyWith(
                        color: theme.isDark
                            ? BatPalette.white60
                            : BatPalette.grey60,
                      ),
                )
              ],
            ),
          ],
        ),
        Text(
          '250KWh',
          style: BatThemeData.of(context).typography.subtitle.copyWith(
                color: theme.isDark ? BatPalette.white60 : BatPalette.grey60,
              ),
        ),
      ],
    );
  }
}
