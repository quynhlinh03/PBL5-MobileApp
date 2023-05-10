import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbl5_app/pages/nav_pages/navpages.dart';
import 'package:pbl5_app/services/notification_service.dart';
import 'package:pbl5_app/values/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/signup_pages/welcome.dart';
import 'values/app_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService.initializeNotification();
  await NotificationService.initializeRemoteNotifications(debug: true);
  runApp(const MyApp());
  _init();
}

final notifController = NotificationService();
_init() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  notifController.checkPermission();
  notifController.requestFirebaseToken();
  final token = prefs.getString("userID");
  if (token != null) {
    print('Token: $token');
    Get.offAll(() => const MainPageNav());
  } else {
    Get.offAll(() => const WelcomePage());
  }
}

Future<void> sendFCM() async {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PBL5',
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
