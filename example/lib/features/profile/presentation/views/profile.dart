import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/navigation/navigator.dart';
import '../widgets/general_tile.dart';
import '../widgets/member_tile.dart';
import '../widgets/summary_tile.dart';

class ProfileScreen extends StatelessWidget {
  final Widget trailing;
  const ProfileScreen({Key? key, required this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = BatThemeData.of(context);
    return Scaffold(
      backgroundColor: theme.colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.h),
                Row(
                  children: [
                    if (AppNavigator.canPop)
                      GestureDetector(
                        onTap: () => AppNavigator.pop(),
                        child: const Icon(Icons.arrow_back_ios),
                      ),
                    const Expanded(
                      child: Center(
                        child: SizedBox.shrink(),
                      ),
                    ),
                    trailing
                  ],
                ),
                SizedBox(height: 24.h),
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 32.r,
                        backgroundImage:
                            const AssetImage('assets/images/profile.png'),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Tosin',
                        style: theme.typography.bodyCopyMedium
                            .copyWith(color: theme.colors.tertiary),
                      ),
                      Text(
                        'Owodunnialive@gmail.com',
                        style: theme.typography.bodyCopy.copyWith(
                            color: theme.colors.tertiary.withOpacity(0.6)),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 48.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => AppNavigator.pushNamed(statsRoute),
                      child: const ProfileSummaryTile(
                        title: 'Power',
                        subTitle: '2500KWH/Day',
                        icon: Icon(
                          Icons.bolt_sharp,
                          color: BatPalette.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => AppNavigator.pushNamed(devicesRoute),
                      child: const ProfileSummaryTile(
                        title: 'Devices',
                        subTitle: '25 Devices',
                        icon: Icon(
                          Icons.phone_iphone_rounded,
                          color: BatPalette.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 48.h),
                Text(
                  'General Settings',
                  style: theme.typography.bodyCopyMedium,
                ),
                SizedBox(height: 16.h),
                GeneralTile(
                  onTap: () => AppNavigator.pushNamed(settingsRoute),
                  leading: Icon(
                    Icons.settings_outlined,
                    size: 24.w,
                    color: theme.colors.tertiary,
                  ),
                  title: 'Settings',
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: theme.colors.tertiary.withOpacity(0.6),
                  ),
                ),
                SizedBox(height: 16.h),
                GeneralTile(
                  leading: Icon(
                    Icons.explore_outlined,
                    size: 24.w,
                    color: theme.colors.tertiary,
                  ),
                  title: 'My Activity',
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: theme.colors.tertiary.withOpacity(0.6),
                  ),
                ),
                SizedBox(height: 52.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Home members',
                      style: theme.typography.bodyCopyMedium
                          .copyWith(color: theme.colors.tertiary),
                    ),
                    Text(
                      'Add',
                      style: theme.typography.bodyCopy.copyWith(
                          color: theme.colors.tertiary.withOpacity(0.8)),
                    )
                  ],
                ),
                SizedBox(height: 16.h),
                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var names = ['Jay', 'Posi', 'Kike'];
                      if (index == names.length - 1) {
                        return Column(
                          children: [
                            MemberTile(name: names[index]),
                            SizedBox(height: 24.h)
                          ],
                        );
                      }
                      return MemberTile(name: names[index]);
                    },
                    separatorBuilder: (_, __) => SizedBox(height: 8.h),
                    itemCount: 3,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
