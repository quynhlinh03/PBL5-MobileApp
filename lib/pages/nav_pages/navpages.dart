import 'package:flutter/material.dart';
import 'package:pbl5_app/pages/nav_pages/Pages/camera.dart';
import '../../values/app_colors.dart';
import 'Pages/homePage.dart';
import 'Pages/barChartPage.dart';

class MainPageNav extends StatefulWidget {
  const MainPageNav({Key? key}) : super(key: key);

  @override
  State<MainPageNav> createState() => _MainPageNavState();
}

class _MainPageNavState extends State<MainPageNav> {
  int _selectIndex = 0;
  final screens = [
    const HomePage(),
    const CameraPage(),
    const BarChartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const NavigationDrawerLeft(),
      // appBar: AppBar(
      //   backgroundColor: AppColors.greenGray,
      //   elevation: 0,
      // ),
      body: screens[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.greenGray,
          unselectedItemColor: Colors.black.withOpacity(0.6),
          selectedFontSize: 10,
          unselectedFontSize: 10,
          currentIndex: _selectIndex,
          onTap: (i) => setState(() => _selectIndex = i),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_camera_front_outlined),
                activeIcon: Icon(Icons.video_camera_front_rounded),
                label: ''),
            // BottomNavigationBarItem(
            //   label: '',
            //   icon: Icon(Icons.pie_chart_outline),
            //   activeIcon: Icon(Icons.pie_chart_outline_rounded),
            // ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.line_axis),
              activeIcon: Icon(Icons.line_axis_rounded),
            ),
          ]),
    );
  }
}
