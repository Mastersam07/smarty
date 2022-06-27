import 'package:flutter/material.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../../res/res.dart';
import '../../../devices/domain/models/devices.dart';
import '../../../../utils/enums.dart';

class DeviceCard extends StatefulWidget {
  final Device device;
  const DeviceCard({
    Key? key,
    required this.device,
  }) : super(key: key);

  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNavigator.pushNamed(widget.device.type.routeName,
          arguments: widget.device),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: SmartyColors.secondary10,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  widget.device.type.icon ?? 'assets/icons/ac.png',
                  width: 48,
                ),
                const SizedBox(width: 32),
                Switch.adaptive(
                  activeColor: SmartyColors.primary,
                  value: widget.device.active,
                  onChanged: (bool v) {
                    setState(() {
                      widget.device.active = v;
                    });
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              widget.device.name ?? widget.device.type.name,
              style: TextStyles.body.copyWith(color: SmartyColors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              widget.device.room,
              style: TextStyles.body.copyWith(color: SmartyColors.grey60),
            )
          ],
        ),
      ),
    );
  }
}
