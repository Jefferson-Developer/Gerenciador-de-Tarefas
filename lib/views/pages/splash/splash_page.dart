import 'package:flutter/material.dart';
import 'package:job_timer/controllers/core/ui/app_colors.dart';
import 'package:job_timer/controllers/helper/constants/assets_constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.gradientColors,
          ),
        ),
        child: Center(
          child: Image.asset(
            AssetsConstants.appLogo,
          ),
        ),
      ),
    );
  }
}
