import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_fetch_with_cubit/app/routing/app_routes.dart';
import 'package:user_fetch_with_cubit/core/network/dio_factory.dart';
import 'package:user_fetch_with_cubit/features/home/data/repos/home_repo.dart';
import 'package:user_fetch_with_cubit/features/home/logic/home_cubit.dart';
import 'package:user_fetch_with_cubit/features/home/ui/home_screen.dart';
import 'package:user_fetch_with_cubit/features/splash/ui/splash_screen.dart';

class AppRouter {
  AppRouter._();
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                HomeCubit(HomeRepo(DioFactory.create()))..getUsers(),
            child: HomeScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text('Something Went Wrong.'))),
        );
    }
  }
}
