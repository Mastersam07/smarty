import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:smarty/core/navigation/navigator.dart';
import 'package:smarty/widgets/widgets.dart';

import 'shared/res/res.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: SmartyThemeData.lightTheme,
      home: const MyHomePage(),
      onGenerateRoute: AppRouter.generateRoutes,
      navigatorKey: AppNavigator.key,
    );
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
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 46),
              child: Column(
                children: [
                  Image.asset('assets/images/home1.png'),
                  const SizedBox(height: 96),
                  Text(
                    'Smart',
                    style: TextStyles.headline3.copyWith(
                        color: SmartyColors.primary,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 16),
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
            const SizedBox(height: 64),
            DotsIndicator(dotsCount: 3),
            const SizedBox(height: 64),
            AppButtonPrimary(
                label: 'Get Started',
                onPressed: () => AppNavigator.pushNamedReplacement(loginRoute)),
          ],
        ),
      ),
    );
  }
}
