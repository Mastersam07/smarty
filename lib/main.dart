import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/navigation/navigator.dart';

import 'shared/res/res.dart';
import 'shared/widgets/page_indicator.dart';
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
          title: 'Smarty',
          theme: SmartyThemeData.lightTheme,
          darkTheme: SmartyThemeData.darkTheme,
          home: const MyHomePage(),
          onGenerateRoute: AppRouter.generateRoutes,
          navigatorKey: AppNavigator.key,
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController? _pageController;
  Timer? _pageAnimationTimer;
  int _page = 0;

  void _animatePages() {
    if (_pageController == null) return;
    if (_page < 2) {
      _pageController?.nextPage(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageAnimationTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _animatePages();
    });
  }

  @override
  void dispose() {
    _pageAnimationTimer?.cancel();
    _pageAnimationTimer = null;
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 8,
              child: PageView(
                controller: _pageController,
                onPageChanged: (newPage) {
                  setState(() {
                    _page = newPage;
                  });
                },
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 46.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 46.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/home2.png'),
                        SizedBox(height: 96.h),
                        Text(
                          'Control',
                          style: TextStyles.headline3.copyWith(
                              color: SmartyColors.primary,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Control all your electronic devices with at a single click with just your smart phone',
                          style: TextStyles.body.copyWith(
                              color: SmartyColors.grey80,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 46.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/home3.png'),
                        SizedBox(height: 96.h),
                        Text(
                          'Automate',
                          style: TextStyles.headline3.copyWith(
                              color: SmartyColors.primary,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Create routines and schedule devices to run along with your routine',
                          style: TextStyles.body.copyWith(
                              color: SmartyColors.grey80,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 4,
                child: Column(
                  children: [
                    SizedBox(height: 64.h),
                    PageIndicatorWidget(
                      count: 3,
                      value: _page,
                      size: 12.w,
                    ),
                    SizedBox(height: 64.h),
                    AppButtonPrimary(
                      label: 'Get Started',
                      onPressed: () =>
                          AppNavigator.pushNamedReplacement(loginRoute),
                    ),
                    SizedBox(height: 42.h),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
