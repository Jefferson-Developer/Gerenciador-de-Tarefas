import 'package:flutter/material.dart';
import 'package:job_timer/controllers/cores/ui/app_colors.dart';
import 'package:job_timer/controllers/helpers/app_state.dart';
import 'package:job_timer/controllers/helpers/constants/assets_constants.dart';
import 'package:job_timer/views/pages/splash/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends AppState<SplashPage, SplashState> {

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
