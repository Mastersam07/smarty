import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final Widget trailing;
  final void Function()? onTap;
  const SettingsTile({
    Key? key,
    required this.title,
    this.trailing = const Icon(
      Icons.arrow_forward_ios,
      size: 14,
    ),
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = BatThemeData.of(context);
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: theme.typography.bodyCopy,
          ),
          trailing: trailing,
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
