import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/res/res.dart';

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
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: TextStyles.body,
          ),
          trailing: trailing,
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
