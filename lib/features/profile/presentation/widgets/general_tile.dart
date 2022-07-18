import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/res/res.dart';

class GeneralTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final Widget trailing;
  final void Function()? onTap;
  const GeneralTile({
    Key? key,
    required this.leading,
    required this.title,
    required this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: SmartyColors.grey10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                leading,
                SizedBox(width: 6.w),
                Text(
                  title,
                  style: TextStyles.body.copyWith(color: SmartyColors.grey60),
                ),
              ],
            ),
            trailing
          ],
        ),
      ),
    );
  }
}
