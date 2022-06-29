import 'package:flutter/material.dart';

import '../../../../shared/res/res.dart';

class QuickAction extends StatelessWidget {
  final String action;
  const QuickAction({
    Key? key,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      // margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: SmartyColors.primary,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.sunny, size: 24, color: SmartyColors.tertiary),
              const SizedBox(width: 4),
              Text(
                action,
                style: TextStyles.body.copyWith(color: SmartyColors.tertiary),
              )
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '6:00 AM',
            style: TextStyles.body.copyWith(color: SmartyColors.tertiary80),
          ),
          const SizedBox(height: 4),
          Text(
            '5 Devices',
            style: TextStyles.body.copyWith(color: SmartyColors.tertiary80),
          )
        ],
      ),
    );
  }
}
