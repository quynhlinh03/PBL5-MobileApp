import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_colors.dart';
import 'package:pbl5_app/values/app_styles.dart';
import './pages/signup_pages/welcome.dart';
import 'values/app_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: AppFont.lexend,
      ),
      home: const WelcomePage(),
    );
  }
}
