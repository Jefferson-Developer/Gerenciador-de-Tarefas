import 'package:flutter/material.dart';
import 'package:job_timer/controllers/core/ui/job_time_icons.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Container(
        child: Center(child: Icon(JobTimeIcons.angle_double_right),),
      ),
    );
  }
}
