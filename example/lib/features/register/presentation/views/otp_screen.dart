import 'dart:async';

import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:smarty/main.dart';

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
    var theme = context.read<ThemeProvider>();
    return Scaffold(
      backgroundColor: BatThemeData.of(context).colors.background,
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
                style: BatThemeData.of(context)
                    .typography
                    .headline4
                    .copyWith(color: SmartyColors.primary),
              ),
              SizedBox(height: 16.h),
              Text(
                'Enter the 6 digits code sent to your email address for verification',
                style: BatThemeData.of(context)
                    .typography
                    .bodyCopyMedium
                    .copyWith(
                      color:
                          theme.isDark ? BatPalette.white80 : BatPalette.grey80,
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
              activeFillColor: BatThemeData.of(context).colors.background,
              activeColor:
                  theme.isDark ? BatPalette.white60 : BatPalette.grey60,
              inactiveFillColor: BatThemeData.of(context).colors.background,
              inactiveColor:
                  theme.isDark ? BatPalette.white60 : BatPalette.grey60,
              selectedFillColor: BatThemeData.of(context).colors.background,
              selectedColor:
                  theme.isDark ? BatPalette.white60 : BatPalette.grey60,
            ),
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: BatThemeData.of(context).colors.background,
            enableActiveFill: true,
            errorAnimationController: errorController,
            controller: textEditingController,
            onCompleted: (value) {},
            onChanged: (value) {},
            beforeTextPaste: (text) {
              return true;
            },
            cursorColor: theme.isDark ? BatPalette.white60 : BatPalette.grey60,
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
              style: BatThemeData.of(context).typography.bodyCopyMedium,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ]),
      ),
    );
  }
}
