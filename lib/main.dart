import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/controllers/helpers/firebase_initializer.dart';
import 'package:job_timer/controllers/modules/app_module.dart';
import 'package:job_timer/views/app_widget.dart';

void main() async {
  await FirebaseInitializer.initialize();
  runApp(
    ModularApp(
      debugMode: false,
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
