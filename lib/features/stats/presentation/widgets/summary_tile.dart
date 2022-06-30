import 'package:flutter/material.dart';

import '../../../../shared/res/res.dart';

class SummaryTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget icon;
  const SummaryTile(
      {Key? key,
      required this.icon,
      required this.subTitle,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: SmartyColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: SmartyColors.secondary60,
            child: icon,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.headline4.copyWith(
                    color: SmartyColors.tertiary, fontWeight: FontWeight.w500),
              ),
              Text(
                subTitle,
                style: TextStyles.body.copyWith(
                  color: SmartyColors.tertiary60,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
