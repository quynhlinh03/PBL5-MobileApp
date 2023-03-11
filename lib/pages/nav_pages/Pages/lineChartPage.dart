import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../values/app_colors.dart';
import '../../../pages/nav_pages/Drawer/navigation_drawer.dart';
import '../../../pages/signup_pages/login_screen.dart';
import '../../../pages/nav_pages/Pages/manualPage.dart';
import '../../../pages/nav_pages/Pages/correctPosturePage.dart';
import '../../../pages/nav_pages/Pages/addDevicesPage.dart';

class LineChartPage extends StatefulWidget {
  const LineChartPage({ Key? key }) : super(key: key);

  @override
  _LineChartPageState createState() => _LineChartPageState();
}

class _LineChartPageState extends State<LineChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerLeft(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center, // canh giữa theo chiều dọc
            children: [
              Container(
                child: Text("Posture Analysis ", style: AppStyle.regular.copyWith(fontSize: 20),)
              ),
              SizedBox(height: 20),
              Container(
                width: 150,
                height: 150,
                color: Colors.green,
              ),
              SizedBox(height: 20),
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
            ],
          ),
        ),
    );
  }
}
