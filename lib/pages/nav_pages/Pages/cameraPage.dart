import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../values/app_colors.dart';
import '../../../pages/nav_pages/Drawer/navigation_drawer.dart';
import '../../../pages/signup_pages/login_screen.dart';
import '../../../pages/nav_pages/Pages/manualPage.dart';
import '../../../pages/nav_pages/Pages/correctPosturePage.dart';
import '../../../pages/nav_pages/Pages/addDevicesPage.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({ Key? key }) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerLeft(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      
    );
  }
}