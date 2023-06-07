import 'dart:convert';

import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:pbl5_app/pages/nav_pages/navpages.dart';
import 'package:pbl5_app/services/notification_service.dart';
import 'package:pbl5_app/values/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/signup_pages/welcome.dart';
import 'values/app_fonts.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService.initializeNotification();
  await NotificationService.initializeRemoteNotifications(debug: true);
  runApp(const MyApp());
  _init();
}

var url = "";
final notifController = NotificationService();
_init() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  notifController.checkPermission();
  notifController.requestFirebaseToken();
  Get.testMode = true;
  final token = prefs.getString("userID");
  if (token != null) {
    print('Token: $token');
    sendDataToServer();
    Get.offAll(() => const MainPageNav());
  } else {
    Get.offAll(() => const WelcomePage());
  }
}

Future<void> sendDataToServer() async {
  final fcm = await AwesomeNotificationsFcm().requestFirebaseAppToken();
  final body = {'fcm': fcm.toString(), "user_id": "1"};
  try {
    final info = NetworkInfo();
    final String ipAddress = await info.getWifiIP() ?? '';
    if (ipAddress == '') {
      print("error");
    } else {
      List<String> parts = ipAddress.split('.');
      String firstThreeParts = parts.sublist(0, 3).join('.');
      url = 'http://$firstThreeParts.130:8000/fcm';
      print("URL : $url");
      print("FCM : $fcm");
    }
    final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type":"application/json"},
        body: json.encode({
          'fcm': fcm.toString(),
          'user_id': 1
        }) // Replace with your data
        );

    if (response.statusCode == 200) {
      print('Response: ${response.body}');
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception: $e');
  }
}

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
