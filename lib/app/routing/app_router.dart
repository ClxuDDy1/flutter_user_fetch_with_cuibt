import 'package:flutter/material.dart';
import 'package:user_fetch_with_cubit/app/routing/app_routes.dart';

class AppRouter {
  AppRouter._();
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text('Splash Screen'))),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text('Home Screen'))),
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text('Something Went Wrong.'))),
        );
    }
  }
}
