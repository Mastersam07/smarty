import 'package:flutter/material.dart';
import 'package:smarty/features/devices/domain/models/devices.dart';

import '../../../../res/res.dart';
import '../../../../widgets/widgets.dart';
import '../../../home/presentation/widgets/widgets.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32 + MediaQuery.of(context).padding.top),
            Text(
              'Devices',
              style: TextStyles.headline4,
            ),
            const SizedBox(height: 32),
            Text(
              'Living Room',
              style: TextStyles.body,
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [...devices.map((e) => DeviceCard(device: e))],
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Bed Room',
              style: TextStyles.body,
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [...devices.map((e) => DeviceCard(device: e))],
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Kitchen',
              style: TextStyles.body,
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [...devices.map((e) => DeviceCard(device: e))],
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Dining Room',
              style: TextStyles.body,
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [...devices.map((e) => DeviceCard(device: e))],
              ),
            ),
            const SizedBox(height: 48),
            AppButtonPrimary(
              label: 'Add Device',
              onPressed: () {},
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}
