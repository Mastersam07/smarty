import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/navigation/navigator.dart';

import '../../../../shared/res/res.dart';
import '../../../../shared/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = BatThemeData.of(context);
    return Scaffold(
      backgroundColor: theme.colors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 109.h),
            Image.asset("assets/images/logo.png",
                color: theme.colors.primary, width: 174.w),
            SizedBox(height: 64.h),
            Text(
              'Login to your account',
              style: TextStyles.headline4.copyWith(
                  color: theme.colors.primary, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 48.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email',
                  style: theme.typography.bodyCopyMedium
                      .copyWith(color: theme.colors.tertiary),
                ),
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
                Text(
                  'Password',
                  style: theme.typography.bodyCopyMedium
                      .copyWith(color: theme.colors.tertiary),
                ),
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
            RichText(
              text: TextSpan(
                text: 'Don\'t have an account? ',
                style: theme.typography.bodyCopyMedium
                    .copyWith(color: theme.colors.tertiary.withOpacity(0.6)),
                children: [
                  TextSpan(
                    text: 'Create account',
                    style: theme.typography.bodyCopyMedium
                        .copyWith(color: theme.colors.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => AppNavigator.pushNamed(registerRoute),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom * 2),
          ],
        ),
      ),
    );
  }
}
