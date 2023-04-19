import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChipTab extends StatelessWidget {
  final String name;
  final int selectedIndex;
  final int index;
  const ChipTab({
    Key? key,
    required this.selectedIndex,
    required this.name,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = BatThemeData.of(context);
    return Container(
      width: 55.w,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: selectedIndex == index
            ? theme.colors.primary
            : theme.colors.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          name,
          style: theme.typography.subtitle.copyWith(
              color: selectedIndex == index
                  ? BatPalette.white
                  : theme.colors.tertiary.withOpacity(0.8)),
        ),
      ),
    );
  }
}
