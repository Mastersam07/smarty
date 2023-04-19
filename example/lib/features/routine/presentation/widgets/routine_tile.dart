import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    var theme = BatThemeData.of(context);
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: active ? BatPalette.primary : BatPalette.grey10,
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
                color: active ? BatPalette.white : BatPalette.grey60,
              ),
              SizedBox(width: 4.w),
              Text(
                name,
                style: theme.typography.bodyCopy.copyWith(
                    color: active ? BatPalette.white : BatPalette.grey60),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '6:00 AM',
                style: theme.typography.subtitle.copyWith(
                    color: active ? BatPalette.white80 : BatPalette.grey60),
              ),
              Text(
                '5 Devices',
                style: theme.typography.subtitle.copyWith(
                    color: active ? BatPalette.white80 : BatPalette.grey60),
              ),
            ],
          )
        ],
      ),
    );
  }
}
