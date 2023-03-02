import 'package:flutter/material.dart';

import '../../../pages/nav_pages/Drawer/DrawerMenu/change_pass_page.dart';
import '../../../pages/nav_pages/Drawer/DrawerMenu/logout_page.dart';
import '../../../pages/nav_pages/Drawer/DrawerMenu/profile_page.dart';
import '../../../pages/nav_pages/Drawer/DrawerMenu/setting_page.dart';
import '../../../pages/nav_pages/Drawer/Items/drawer_item.dart';
import '../../../values/app_colors.dart';

class NavigationDrawerLeft extends StatelessWidget {
  const NavigationDrawerLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white10.withOpacity(0),
      child: Material(
        shadowColor: Colors.lightBlueAccent,
        borderRadius: const BorderRadiusDirectional.only(
            topEnd: Radius.circular(10), bottomEnd: Radius.circular(10)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 40, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                name: 'Profile',
                icon: Icons.people,
                onPressed: () => onItemPressed(context, index: 0),
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                name: 'Change Password',
                icon: Icons.password,
                onPressed: () => onItemPressed(context, index: 1),
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                name: 'Help',
                icon: Icons.gif_box_outlined,
                onPressed: () => onItemPressed(context, index: 2),
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                name: 'Settings',
                icon: Icons.settings_outlined,
                onPressed: () => onItemPressed(context, index: 3),
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                name: 'Logout',
                icon: Icons.logout_rounded,
                onPressed: () => onItemPressed(context, index: 4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfilePage()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ChangePassPage()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ChangePassPage()));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SettingPage()));
        break;
      case 4:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LogOutPage()));
        break;
    }
  }

  Widget headerWidget() {
    const url =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxQeDXrL0QAJXo-i-h01SqL-Xwu6yA7pU5rJHaTq36sA&s";

    return SizedBox(
      height: 200,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(url),
          ),
          const SizedBox(
            width: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(
                height: 80,
              ),
              Text(
                "User",
                style: TextStyle(fontSize: 14, color: AppColors.fontNormal),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '@gmail.com',
                style: TextStyle(fontSize: 14, color: AppColors.fontNormal),
                textAlign: TextAlign.center,
              )
            ],
          )
        ],
      ),
    );
  }
}
