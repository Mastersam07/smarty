import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../../shared/res/res.dart';
import '../../../../shared/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Create an account',
              style: TextStyles.headline4.copyWith(
                  color: SmartyColors.primary, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 48.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Email'),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your email',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
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
              label: 'Sign up',
              onPressed: () => AppNavigator.pushNamed(otpRoute),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => AppNavigator.pushNamed(loginRoute),
              child: Text(
                'Already have an account? Log in',
                style: TextStyles.body,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }
}
