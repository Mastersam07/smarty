import 'package:flutter/material.dart';
import 'package:smarty/core/navigation/navigator.dart';

import '../../../../shared/res/res.dart';
import '../../../devices/domain/models/devices.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 32 + MediaQuery.of(context).padding.top),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Good Morning, Tosin',
                  style: TextStyles.headline4,
                ),
              ),
              GestureDetector(
                onTap: () => AppNavigator.pushNamed(
                  profileRoute,
                  arguments: Icon(
                    Icons.notifications_outlined,
                    color: SmartyColors.grey,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const SummaryHeader(),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quick Action',
                style: TextStyles.body.copyWith(
                  fontWeight: FontWeight.w500,
                  color: SmartyColors.grey,
                ),
              ),
              Text(
                'Edit',
                style: TextStyles.body.copyWith(
                  color: SmartyColors.grey60,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...['Wake up', 'Sleep', 'Clean']
                  .map((e) => QuickAction(action: e))
            ],
          ),
          const SizedBox(height: 32),
          Text(
            'Active Devices',
            style: TextStyles.body.copyWith(
              fontWeight: FontWeight.w500,
              color: SmartyColors.grey,
            ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rooms',
                style: TextStyles.body.copyWith(
                  fontWeight: FontWeight.w500,
                  color: SmartyColors.grey,
                ),
              ),
              Text(
                'Edit',
                style: TextStyles.body.copyWith(
                  color: SmartyColors.grey60,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 100,
                ),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return const RoomCard();
                }),
          ),
        ]),
      ),
    );
  }
}
