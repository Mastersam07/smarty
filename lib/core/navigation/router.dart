import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarty/core/navigation/route.dart';
import 'package:smarty/features/login/presentation/views/login.dart';

import '../../features/app_home.dart';
import '../../features/devices/domain/models/devices.dart';
import '../../features/devices/presentation/views/ac.dart';
import '../../features/devices/presentation/views/light.dart';
import '../../features/register/presentation/views/otp_screen.dart';
import '../../features/register/presentation/views/register.dart';
import '../../features/routine/presentation/views/routine_home.dart';

abstract class AppRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return getPageRoute(
          settings: settings,
          view: const LoginScreen(),
        );

      case registerRoute:
        return getPageRoute(
          settings: settings,
          view: const RegisterScreen(),
        );

      case otpRoute:
        return getPageRoute(
          settings: settings,
          view: const OtpScreen(),
        );

      case dashboardRoute:
        return getPageRoute(
          settings: settings,
          view: const Dashboard(),
        );

      case routineRoute:
        return getPageRoute(
          settings: settings,
          view: const RoutineHomeScreen(),
        );

      case lightRoute:
        return getPageRoute(
          settings: settings,
          view: LightScreen(device: settings.arguments as Device),
        );

      case acRoute:
        return getPageRoute(
          settings: settings,
          view: AcScreen(device: settings.arguments as Device),
        );

      default:
        return getPageRoute(
          settings: settings,
          view: Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static PageRoute<dynamic> getPageRoute({
    required RouteSettings settings,
    required Widget view,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute(settings: settings, builder: (_) => view)
        : MaterialPageRoute(settings: settings, builder: (_) => view);
  }
}
