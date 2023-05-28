import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smarty/main.dart';
import '../../../../core/navigation/navigator.dart';

import '../../../devices/domain/models/devices.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.read<ThemeProvider>();
    var theme = BatThemeData.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 32.h + MediaQuery.of(context).padding.top),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Good Morning, Codefarmer',
                  style: theme.typography.headline4,
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        provider.changeMode();
                      },
                      icon: const Icon(Icons.lightbulb)),
                  GestureDetector(
                    onTap: () => AppNavigator.pushNamed(
                      profileRoute,
                      // arguments: Icon(
                      //   Icons.notifications_outlined,
                      //   color: color.tertiary,
                      // ),
                    ),
                    child: const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 32.h),
          const SummaryHeader(),
          SizedBox(height: 32.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quick Action',
                style: theme.typography.bodyCopyMedium,
              ),
              Text(
                'Edit',
                style: theme.typography.bodyCopy,
              )
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...['Wake up', 'Sleep', 'Clean']
                  .map((e) => QuickAction(action: e))
            ],
          ),
          SizedBox(height: 32.h),
          Text(
            'Active Devices',
            style: theme.typography.bodyCopyMedium,
          ),
          SizedBox(height: 16.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [...devices.map((e) => DeviceCard(device: e))],
            ),
          ),
          SizedBox(height: 32.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rooms',
                style: theme.typography.bodyCopyMedium,
              ),
              Text(
                'Edit',
                style: theme.typography.bodyCopy,
              )
            ],
          ),
          SizedBox(height: 16.h),
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
