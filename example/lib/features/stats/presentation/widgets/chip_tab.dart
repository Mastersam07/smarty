import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/res/res.dart';

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
    return Container(
      width: 55.w,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: selectedIndex == index
            ? SmartyColors.primary
            : SmartyColors.secondary10,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyles.subtitle.copyWith(
              color: selectedIndex == index
                  ? SmartyColors.tertiary
                  : SmartyColors.primary60),
        ),
      ),
    );
  }
}
