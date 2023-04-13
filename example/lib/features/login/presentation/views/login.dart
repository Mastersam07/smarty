import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/navigation/navigator.dart';

import '../../../../shared/res/res.dart';
import '../../../../shared/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BatThemeData.of(context).colors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 109.h),
            Image.asset("assets/images/logo.png",
                color: SmartyColors.primary, width: 174.w),
            SizedBox(height: 64.h),
            Text(
              'Login to your account',
              style: TextStyles.headline4.copyWith(
                  color: SmartyColors.primary, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 48.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Email'),
                SizedBox(height: 8.h),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your email',
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Password'),
                SizedBox(height: 8.h),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your password',
                  ),
                ),
              ],
            ),
            SizedBox(height: 64.h),
            AppButtonPrimary(
              label: 'Login',
              onPressed: () => AppNavigator.pushNamedAndClear(dashboardRoute),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => AppNavigator.pushNamed(registerRoute),
              child: Text(
                'Don\'t have an account? Create account',
                style: BatThemeData.of(context).typography.bodyCopyMedium,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom * 2),
          ],
        ),
      ),
    );
  }
}
