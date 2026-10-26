import 'package:flutter/material.dart';
import 'package:user_fetch_with_cubit/app/routing/app_routes.dart';
import 'package:user_fetch_with_cubit/features/home/ui/home_screen.dart';
import 'package:user_fetch_with_cubit/features/splash/ui/splash_screen.dart';

class AppRouter {
  AppRouter._();
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text('Something Went Wrong.'))),
        );
    }
  }
}
