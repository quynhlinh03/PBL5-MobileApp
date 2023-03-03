import 'package:flutter/material.dart';
import '../../values/app_colors.dart';
import '../../values/app_fonts.dart';

class AppStyle {
  static const TextStyle light1 = TextStyle(
      fontFamily: AppFont.lexend,
      fontSize: 14,
      color: AppColors.fontNormal,
      fontWeight: FontWeight.w300);
  static const TextStyle light2 = TextStyle(
      fontFamily: AppFont.lexend,
      fontSize: 16,
      color: AppColors.fontNormal,
      fontWeight: FontWeight.w300);
  static const TextStyle medium = TextStyle(
      fontFamily: AppFont.lexend,
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w500);
  static const TextStyle regular = TextStyle(
      fontFamily: AppFont.lexend,
      fontSize: 36,
      color: Colors.black,
      fontWeight: FontWeight.w400);
  static const TextStyle regular2 = TextStyle(
      fontFamily: AppFont.lexend,
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.w400);
  static const TextStyle bold = TextStyle(
      fontFamily: AppFont.lexend,
      fontSize: 34,
      color: Colors.black,
      fontWeight: FontWeight.bold);
}
