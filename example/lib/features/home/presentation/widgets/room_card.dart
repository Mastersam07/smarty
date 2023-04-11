import 'package:flutter/material.dart';

import '../../../../shared/res/res.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      height: 100,
      decoration: BoxDecoration(
        color: SmartyColors.primary,
        borderRadius: BorderRadius.circular(6.0),
        image: const DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
          colors: [
            SmartyColors.black,
            SmartyColors.black.withOpacity(0.1),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Living Room',
            style: TextStyles.body.copyWith(color: SmartyColors.tertiary),
          ),
          const SizedBox(height: 4),
          Text(
            '10 Devices',
            style: TextStyles.body.copyWith(color: SmartyColors.tertiary80),
          )
        ],
      ),
    );
  }
}
