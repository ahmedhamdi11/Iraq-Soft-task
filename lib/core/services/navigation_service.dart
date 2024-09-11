import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String routeName, {dynamic arg}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arg);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {dynamic arg}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      arguments: arg,
      (route) => false,
    );
  }

  Future<dynamic> pushReplacementNamed(String routName, {dynamic arg}) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routName,
      arguments: arg,
    );
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }
}
