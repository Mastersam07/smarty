import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../../shared/res/res.dart';
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
    return Scaffold(
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
                style:
                    TextStyles.headline4.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16.h),
              Text(
                'Enter the 6 digits code sent to your email address for verification',
                style: TextStyles.body.copyWith(
                    color: SmartyColors.grey80, fontWeight: FontWeight.w500),
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
              activeFillColor: SmartyColors.tertiary,
              activeColor: SmartyColors.grey60,
              inactiveFillColor: SmartyColors.tertiary,
              inactiveColor: SmartyColors.error80,
              selectedFillColor: SmartyColors.tertiary,
              selectedColor: SmartyColors.grey60,
            ),
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: SmartyColors.tertiary,
            enableActiveFill: true,
            errorAnimationController: errorController,
            controller: textEditingController,
            onCompleted: (value) {},
            onChanged: (value) {},
            beforeTextPaste: (text) {
              return true;
            },
          ),
          SizedBox(height: 51.h),
          AppButtonPrimary(
            label: 'Verify',
            onPressed: () => AppNavigator.pushNamedReplacement(loginRoute),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Didn\'t receive code? Resend code',
              style: TextStyles.body,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ]),
      ),
    );
  }
}
