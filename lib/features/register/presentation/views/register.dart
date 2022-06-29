import 'package:flutter/material.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../../shared/res/res.dart';
import '../../../../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 109),
            Image.asset("assets/images/logo.png",
                color: SmartyColors.primary, width: 174),
            const SizedBox(height: 64),
            Text(
              'Create an account',
              style: TextStyles.headline4.copyWith(
                  color: SmartyColors.primary, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 48),
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
              children: const [
                Text('Password'),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your password',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 64),
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
            const SizedBox(height: 58),
          ],
        ),
      ),
    );
  }
}
