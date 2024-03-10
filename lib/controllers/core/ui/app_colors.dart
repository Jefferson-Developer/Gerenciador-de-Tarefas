import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color _gradientLightColor = Color(0xFF0092B9);
  static const Color _gradientDarkColor = Color(0xFF0167B2);

  static List<Color> get gradientColors => [
        _gradientLightColor,
        _gradientDarkColor,
      ];
}
