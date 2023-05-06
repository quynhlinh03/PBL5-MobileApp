import 'package:flutter/material.dart';

class AppColors {
  static const greenGray = Color.fromRGBO(63, 115, 111, 1);
  static const gray = Color.fromRGBO(0, 0, 0, 0.1);
  static const black05 = Color.fromRGBO(0, 0, 0, 0.05);
  static const greenGrayLight1 = Color.fromRGBO(63, 115, 111, 0.6);
  static const neutral = Color.fromRGBO(30, 32, 44, 1);
  static const fontNormal = Color.fromRGBO(0, 0, 0, 0.8);
  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const whiteBlur = Color.fromRGBO(255, 255, 255, 0.7);
  static const skin = Color.fromRGBO(208, 180, 132, 1);
  static const darkGray = Color.fromRGBO(75, 93, 103, 1);
  static const flower = Color.fromRGBO(169, 144, 126, 1);
  static const mossGreen = Color.fromRGBO(103, 109, 96, 1);
  static const darkGreen = Color.fromRGBO(54, 75, 111, 1);
  static const blackBlur = Color.fromRGBO(185, 189, 208, 1);
}

MaterialColor myColor = const MaterialColor(
  0xFF3F736F,
  <int, Color>{
    50: Color(0xFFE5F6F5),
    100: Color(0xFFB3E4E1),
    200: Color(0xFF80D2CC),
    300: Color(0xFF4DB0AE),
    400: Color(0xFF338F95),
    500: Color(0xFF3F736F), // This is the primary color
    600: Color(0xFF2C534E),
    700: Color(0xFF1A3734),
    800: Color(0xFF06221F),
    900: Color(0xFF000000),
  },
);
