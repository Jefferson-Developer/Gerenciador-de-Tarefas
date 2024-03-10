import 'package:flutter/material.dart';
import 'package:job_timer/controllers/cores/ui/app_colors.dart';
import 'package:job_timer/controllers/helpers/app_state.dart';
import 'package:job_timer/controllers/helpers/constants/assets_constants.dart';
import 'package:job_timer/views/pages/login/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends AppState<LoginPage, LoginState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.gradientColors,
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ValueListenableBuilder<bool>(
                valueListenable: state.isLoading,
                builder: (context, isLoading, child) {
                  if (isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetsConstants.appLogo,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .1,
                        ),
                        SizedBox(
                          width: constraints.maxWidth * .8,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              state.signInGoogle();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[200],
                            ),
                            child: Image.asset(
                              AssetsConstants.googleImage,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}
