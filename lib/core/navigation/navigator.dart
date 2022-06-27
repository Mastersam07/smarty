import 'package:flutter/material.dart';

export 'route.dart';
export 'router.dart';

abstract class AppNavigator {
  AppNavigator._();

  static final key = GlobalKey<NavigatorState>();
  static BuildContext get currentContext => key.currentState!.context;

  static bool get canPop => key.currentState!.canPop();

  static void popUntilIsFirst() {
    return key.currentState!.popUntil(
      (route) => route.isFirst,
    );
  }

  static Future pushNamed(String route, {arguments}) {
    return key.currentState!.pushNamed(route, arguments: arguments);
  }

  static Future pushNamedReplacement(String route, {arguments}) {
    return key.currentState!.pushReplacementNamed(route, arguments: arguments);
  }

  static Future pushNamedAndClear(String route, {arguments}) {
    return key.currentState!.pushNamedAndRemoveUntil(
      route,
      (_) => false,
      arguments: arguments,
    );
  }

  static Future<bool> maybePop([result]) {
    return key.currentState!.maybePop(result);
  }

  static void pop([result]) {
    if (canPop) return key.currentState!.pop(result);
  }
}
