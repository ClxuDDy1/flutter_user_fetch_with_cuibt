import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:user_fetch_with_cubit/app/routing/app_routes.dart';
import 'package:user_fetch_with_cubit/core/constants/asset_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0;

  void _fadeIn() async {
    await Future.delayed(Duration(milliseconds: 100));
    if (mounted) {
      setState(() => _opacity = 1);
    }
  }

  void _navigate() async {
    await Future.delayed(Duration(seconds: 3));
    if (mounted) Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  @override
  void initState() {
    _fadeIn();
    _navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Spacer(),
            AnimatedOpacity(
              duration: Duration(milliseconds: 900),
              opacity: _opacity,
              curve: Curves.easeIn,
              child: Image.asset(AssetConstants.logo),
            ),
            Spacer(),
            LoadingAnimationWidget.dotsTriangle(
              color: Colors.deepPurple,
              size: 32,
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
