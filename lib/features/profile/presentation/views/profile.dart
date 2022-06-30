import 'package:flutter/material.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../../shared/res/res.dart';
import '../widgets/summary_tile.dart';

class ProfileScreen extends StatelessWidget {
  final Widget trailing;
  const ProfileScreen({Key? key, required this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32 + MediaQuery.of(context).padding.top),
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
              const SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tosin',
                      style: TextStyles.body.copyWith(color: SmartyColors.grey),
                    ),
                    Text(
                      'Owodunnialive@gmail.com',
                      style:
                          TextStyles.body.copyWith(color: SmartyColors.grey60),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => AppNavigator.pushNamed(statsRoute),
                    child: ProfileSummaryTile(
                      title: 'Power',
                      subTitle: '2500KWH/Day',
                      icon: Icon(
                        Icons.bolt_sharp,
                        color: SmartyColors.tertiary,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => AppNavigator.pushNamed(devicesRoute),
                    child: ProfileSummaryTile(
                      title: 'Devices',
                      subTitle: '25 Devices',
                      icon: Icon(
                        Icons.phone_iphone_rounded,
                        color: SmartyColors.tertiary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              Text(
                'General Settings',
                style: TextStyles.body,
              ),
              const SizedBox(height: 16),
              GeneralTile(
                leading: Icon(
                  Icons.settings_outlined,
                  size: 24,
                  color: SmartyColors.grey,
                ),
                title: 'Settings',
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: SmartyColors.grey60,
                ),
              ),
              const SizedBox(height: 16),
              GeneralTile(
                  leading: Icon(
                    Icons.explore_outlined,
                    size: 24,
                    color: SmartyColors.grey,
                  ),
                  title: 'My Activity',
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: SmartyColors.grey,
                  )),
              const SizedBox(height: 52),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Home members',
                    style: TextStyles.body.copyWith(
                      color: SmartyColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Add',
                    style: TextStyles.body.copyWith(
                      color: SmartyColors.grey80,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var names = ['Jay', 'Posi', 'Kike'];
                      return MemberTile(
                        name: names[index],
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemCount: 3),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MemberTile extends StatelessWidget {
  final String name;
  const MemberTile({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: SmartyColors.secondary10,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/profile.png',
                width: 32,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyles.subtitle.copyWith(
                        color: SmartyColors.grey, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Guest',
                    style: TextStyles.subtitle
                        .copyWith(color: SmartyColors.grey60),
                  )
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$name\'s Iphone',
                style: TextStyles.subtitle.copyWith(color: SmartyColors.grey),
              ),
              Text(
                '192.168.137.19',
                style: TextStyles.subtitle.copyWith(color: SmartyColors.grey60),
              )
            ],
          )
        ],
      ),
    );
  }
}

class GeneralTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final Widget trailing;
  const GeneralTile({
    Key? key,
    required this.leading,
    required this.title,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: SmartyColors.grey10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              leading,
              const SizedBox(width: 6),
              Text(
                title,
                style: TextStyles.body.copyWith(color: SmartyColors.grey60),
              ),
            ],
          ),
          trailing
        ],
      ),
    );
  }
}
