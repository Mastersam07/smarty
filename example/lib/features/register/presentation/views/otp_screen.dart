import 'dart:async';

import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../../shared/widgets/widgets.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController textEditingController = TextEditingController();

  late StreamController<ErrorAnimationType> errorController;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = BatThemeData.of(context);
    return Scaffold(
      backgroundColor: theme.colors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(children: [
          SizedBox(height: 144.h),
          Image.asset("assets/images/phone.png", width: 163.w),
          SizedBox(height: 75.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 56.w),
            child: Column(children: [
              Text(
                'Enter OTP',
                style: theme.typography.headline4
                    .copyWith(color: theme.colors.primary),
              ),
              SizedBox(height: 16.h),
              Text(
                'Enter the 6 digits code sent to your email address for verification',
                style: theme.typography.bodyCopyMedium.copyWith(
                  color: theme.colors.tertiary.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ),
            ]),
          ),
          SizedBox(height: 48.h),
          PinCodeTextField(
            appContext: context,
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.underline,
              fieldHeight: 50.h,
              fieldWidth: 50.w,
              activeFillColor: theme.colors.background,
              activeColor: theme.colors.tertiary.withOpacity(0.6),
              inactiveFillColor: theme.colors.background,
              inactiveColor: theme.colors.tertiary.withOpacity(0.6),
              selectedFillColor: theme.colors.background,
              selectedColor: theme.colors.tertiary.withOpacity(0.6),
            ),
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: theme.colors.background,
            enableActiveFill: true,
            errorAnimationController: errorController,
            controller: textEditingController,
            onCompleted: (value) {},
            onChanged: (value) {},
            beforeTextPaste: (text) {
              return true;
            },
            cursorColor: theme.colors.tertiary.withOpacity(0.6),
          ),
          SizedBox(height: 51.h),
          AppButtonPrimary(
            label: 'Verify',
            onPressed: () => AppNavigator.pushNamedReplacement(loginRoute),
          ),
          const Spacer(),
          RichText(
            text: TextSpan(
              text: 'Didn\'t receive code? ',
              style: theme.typography.bodyCopyMedium
                  .copyWith(color: theme.colors.tertiary.withOpacity(0.6)),
              children: [
                TextSpan(
                  text: 'Resend code',
                  style: theme.typography.bodyCopyMedium
                      .copyWith(color: theme.colors.primary),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom * 2),
        ]),
      ),
    );
  }
}
