import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    var theme = BatThemeData.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: theme.colors.tertiary.withOpacity(0.1),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                leading,
                SizedBox(width: 6.w),
                Text(
                  title,
                  style: theme.typography.subtitle
                      .copyWith(color: theme.colors.tertiary.withOpacity(0.6)),
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
