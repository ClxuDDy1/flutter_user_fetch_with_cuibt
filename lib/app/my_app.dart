import 'package:flutter/material.dart';
import 'package:user_fetch_with_cubit/app/routing/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(onGenerateRoute: AppRouter.onGenerate);
  }
}
