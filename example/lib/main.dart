import 'dart:async';

import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/navigation/navigator.dart';

import 'shared/widgets/onboarding_widget.dart';
import 'shared/widgets/page_indicator.dart';
import 'shared/widgets/widgets.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
          builder: (BuildContext contxt, value, Widget? child) {
        return ScreenUtilInit(
          designSize: const Size(428, 926),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return BatCave(
              debugShowCheckedModeBanner: false,
              title: 'Smarty',
              themeMode: value.theme,
              theme: const BatThemeData.light(),
              darkTheme: const BatThemeData.dark(),
              home: const MyHomePage(),
              onGenerateRoute: AppRouter.generateRoutes,
              navigatorKey: AppNavigator.key,
            );
          },
        );
      }),
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
      backgroundColor: BatThemeData.of(context).colors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: SizedBox(height: 148.h)),
            Expanded(
              flex: 9,
              child: PageView(
                controller: _pageController,
                onPageChanged: (newPage) {
                  setState(() {
                    _page = newPage;
                  });
                },
                children: const [
                  OnboardingWidget(
                    image: 'assets/images/home1.png',
                    title: 'Smart',
                    subtitle:
                        'Manage the power usage of all your electronic device at your convinience',
                  ),
                  OnboardingWidget(
                    image: 'assets/images/home2.png',
                    title: 'Control',
                    subtitle:
                        'Control all your electronic devices with at a single click with just your smart phone',
                  ),
                  OnboardingWidget(
                    image: 'assets/images/home3.png',
                    title: 'Automate',
                    subtitle:
                        'Create routines and schedule devices to run along with your routine',
                  ),
                ],
              ),
            ),
            Column(
              children: [
                PageIndicatorWidget(
                  count: 3,
                  value: _page,
                ),
                SizedBox(height: 64.h),
                AppButtonPrimary(
                  label: 'Get Started',
                  onPressed: () =>
                      AppNavigator.pushNamedReplacement(loginRoute),
                ),
                SizedBox(height: 42.h),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _theme = ThemeMode.dark;
  ThemeMode get theme => _theme;
  bool get isDark => _theme == ThemeMode.dark;

  void changeMode() {
    _theme = !isDark ? ThemeMode.dark : ThemeMode.light;
    SystemChrome.setSystemUIOverlayStyle(
        isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark);
    notifyListeners();
  }
}
