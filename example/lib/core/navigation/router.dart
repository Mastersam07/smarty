import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/app_home.dart';
import '../../features/devices/domain/models/devices.dart';
import '../../features/devices/presentation/views/ac.dart';
import '../../features/devices/presentation/views/device_home.dart';
import '../../features/devices/presentation/views/light.dart';
import '../../features/devices/presentation/views/tv.dart';
import '../../features/login/presentation/views/login.dart';
import '../../features/profile/presentation/views/profile.dart';
import '../../features/profile/presentation/views/settings.dart';
import '../../features/register/presentation/views/otp_screen.dart';
import '../../features/register/presentation/views/register.dart';
import '../../features/routine/presentation/views/routine_home.dart';
import '../../features/stats/presentation/views/stats_home.dart';
import 'route.dart';

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

      case smartTvRoute:
        return getPageRoute(
          settings: settings,
          view: SmartTvScreen(device: settings.arguments as Device),
        );

      case statsRoute:
        return getPageRoute(
          settings: settings,
          view: const StatsHomeScreen(),
        );

      case profileRoute:
        return getPageRoute(
          settings: settings,
          view: ProfileScreen(
            trailing: (settings.arguments ?? const SizedBox.shrink()) as Widget,
          ),
        );

      case devicesRoute:
        return getPageRoute(
          settings: settings,
          view: const DevicesScreen(),
        );

      case settingsRoute:
        return getPageRoute(
          settings: settings,
          view: const SettingsScreen(),
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
