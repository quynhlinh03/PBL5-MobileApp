import 'package:flutter/material.dart';
import 'package:pbl5_app/pages/nav_pages/Drawer/DrawerMenu/notifications_page.dart';
import 'package:pbl5_app/pages/signup_pages/login_screen.dart';
import 'package:pbl5_app/values/app_assets.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../pages/nav_pages/Drawer/DrawerMenu/change_pass_page.dart';
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
        child: Column(
          children: [
            const SizedBox(
              height: 38,
            ),
            headerWidget(),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
              child: DrawerItem(
                name: 'Notifications',
                icon: Icons.notifications_none,
                onPressed: () => onItemPressed(context, index: 0),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
              child: DrawerItem(
                name: 'Edit Profile',
                icon: Icons.perm_identity_outlined,
                onPressed: () => onItemPressed(context, index: 1),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
              child: DrawerItem(
                name: 'Change Password',
                icon: Icons.password,
                onPressed: () => onItemPressed(context, index: 2),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
            //   child: DrawerItem(
            //     name: 'Settings',
            //     icon: Icons.settings_outlined,
            //     onPressed: () => onItemPressed(context, index: 3),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
              child: DrawerItem(
                name: 'Logout',
                icon: Icons.logout_rounded,
                onPressed: () => onItemPressed(context, index: 4),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NotificationsPage()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfilePage()));
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
            MaterialPageRoute(builder: (context) => const LoginScreen()));
        break;
    }
  }

  Widget headerWidget() {
    const url =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxQeDXrL0QAJXo-i-h01SqL-Xwu6yA7pU5rJHaTq36sA&s";
    // "https://drive.google.com/file/d/16rI0QS0_3dBeVJJG0zBofEZZ2EV8aRyS/view";

    return Container(
      alignment: Alignment.bottomLeft,
      // margin: const EdgeInsets.only(left: 24, top: 40),
      height: 200,
      width: 800,
      color: AppColors.greenGray,
      // child: Padding(
      //   padding: const EdgeInsets.fromLTRB(24.0, 40, 24, 0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 0, top: 50),
            child: const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(AppAsset.ava),
              // backgroundImage: NetworkImage(url),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 26, top: 16),
              child: const Text(
                "Quynh Linh",
                style: AppStyle.mediumwhite,
                textAlign: TextAlign.left,
              )),
        ],
      ),
    );
    // );
  }
}
