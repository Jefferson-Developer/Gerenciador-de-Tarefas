import 'package:flutter/material.dart';
import 'package:job_timer/controllers/cores/ui/app_colors.dart';
import 'package:job_timer/controllers/helpers/constants/assets_constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                        onPressed: () {},
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
          )),
    );
  }
}
