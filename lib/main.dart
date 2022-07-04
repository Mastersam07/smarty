import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/navigation/navigator.dart';

import 'shared/res/res.dart';
import 'shared/widgets/widgets.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: SmartyThemeData.lightTheme,
            darkTheme: SmartyThemeData.darkTheme,
            home: const MyHomePage(),
            onGenerateRoute: AppRouter.generateRoutes,
            navigatorKey: AppNavigator.key,
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 46.w),
              child: Column(
                children: [
                  Image.asset('assets/images/home1.png'),
                  SizedBox(height: 96.h),
                  Text(
                    'Smart',
                    style: TextStyles.headline3.copyWith(
                        color: SmartyColors.primary,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Manage the power usage of all your electronic device at your convinience',
                    style: TextStyles.body.copyWith(
                        color: SmartyColors.grey80,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 64.h),
            DotsIndicator(dotsCount: 3),
            SizedBox(height: 64.h),
            AppButtonPrimary(
                label: 'Get Started',
                onPressed: () => AppNavigator.pushNamedReplacement(loginRoute)),
          ],
        ),
      ),
    );
  }
}
