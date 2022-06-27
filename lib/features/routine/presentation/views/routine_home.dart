import 'package:flutter/material.dart';
import 'package:smarty/core/navigation/navigator.dart';

import '../../../../res/res.dart';

class RoutineHomeScreen extends StatelessWidget {
  const RoutineHomeScreen({Key? key}) : super(key: key);

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
                  Expanded(
                    child: Center(
                      child: Text(
                        'Routine',
                        style: TextStyles.headline4,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
              Text(
                'Active Routines',
                style: TextStyles.body,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: SmartyColors.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.sunny,
                          size: 24,
                          color: SmartyColors.tertiary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Wake up',
                          style: TextStyles.body
                              .copyWith(color: SmartyColors.tertiary),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '6:00 AM',
                          style: TextStyles.subtitle
                              .copyWith(color: SmartyColors.tertiary80),
                        ),
                        Text(
                          '5 Devices',
                          style: TextStyles.subtitle
                              .copyWith(color: SmartyColors.tertiary80),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: SmartyColors.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.sunny,
                          size: 24,
                          color: SmartyColors.tertiary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Clean',
                          style: TextStyles.body
                              .copyWith(color: SmartyColors.tertiary),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '6:00 AM',
                          style: TextStyles.subtitle
                              .copyWith(color: SmartyColors.tertiary80),
                        ),
                        Text(
                          '5 Devices',
                          style: TextStyles.subtitle
                              .copyWith(color: SmartyColors.tertiary80),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: SmartyColors.grey10,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.sunny,
                          size: 24,
                          color: SmartyColors.grey60,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Laundry',
                          style: TextStyles.body
                              .copyWith(color: SmartyColors.grey60),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '6:00 AM',
                          style: TextStyles.subtitle
                              .copyWith(color: SmartyColors.grey60),
                        ),
                        Text(
                          '5 Devices',
                          style: TextStyles.subtitle
                              .copyWith(color: SmartyColors.grey60),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: SmartyColors.grey10,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.sunny,
                          size: 24,
                          color: SmartyColors.grey60,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Work',
                          style: TextStyles.body
                              .copyWith(color: SmartyColors.grey60),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '6:00 AM',
                          style: TextStyles.subtitle
                              .copyWith(color: SmartyColors.grey60),
                        ),
                        Text(
                          '5 Devices',
                          style: TextStyles.subtitle
                              .copyWith(color: SmartyColors.grey60),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: SmartyColors.grey10,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.sunny,
                          size: 24,
                          color: SmartyColors.grey60,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Sleep',
                          style: TextStyles.body
                              .copyWith(color: SmartyColors.grey60),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '6:00 AM',
                          style: TextStyles.subtitle
                              .copyWith(color: SmartyColors.grey60),
                        ),
                        Text(
                          '5 Devices',
                          style: TextStyles.subtitle
                              .copyWith(color: SmartyColors.grey60),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: SmartyColors.grey10,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.sunny,
                          size: 24,
                          color: SmartyColors.grey60,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Gym',
                          style: TextStyles.body
                              .copyWith(color: SmartyColors.grey60),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '6:00 AM',
                          style: TextStyles.subtitle
                              .copyWith(color: SmartyColors.grey60),
                        ),
                        Text(
                          '5 Devices',
                          style: TextStyles.subtitle
                              .copyWith(color: SmartyColors.grey60),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    size: 48,
                    color: SmartyColors.tertiary,
                  ),
                  backgroundColor: SmartyColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
