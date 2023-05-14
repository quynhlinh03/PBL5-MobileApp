import 'package:flutter/material.dart';
import 'package:pbl5_app/controller/auth_controller.dart';
import 'package:pbl5_app/pages/nav_pages/Drawer/DrawerMenu/notitest.dart';
import 'package:pbl5_app/values/app_assets.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../controller/user_controller.dart';
import '../../../pages/nav_pages/Drawer/DrawerMenu/change_pass_page.dart';
import '../../../pages/nav_pages/Drawer/Items/drawer_item.dart';
import '../../../values/app_colors.dart';
import 'DrawerMenu/profile_page.dart';

class NavigationDrawerLeft extends StatelessWidget {
  NavigationDrawerLeft({Key? key}) : super(key: key);
  final userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white10.withOpacity(0),
      child: Material(
        shadowColor: Colors.lightBlueAccent,
        borderRadius: const BorderRadiusDirectional.only(
          topEnd: Radius.circular(10),
          bottomEnd: Radius.circular(10),
        ),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                height: 260,
                width: 800,
                color: AppColors.greenGray,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 38,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 26, top: 76),
                      alignment: Alignment.bottomLeft,
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(AppAsset.ava),
                      ),
                    ),
                    FutureBuilder(
                      future: userController.readUser(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final user = snapshot.data!;
                          return Container(
                              margin: const EdgeInsets.only(left: 26, top: 18),
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                user.name,
                                style: AppStyle.mediumwhite,
                                textAlign: TextAlign.left,
                              ));
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 28,
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
                  Container(
                    margin: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                    child: DrawerItem(
                      name: 'Logout',
                      icon: Icons.logout_rounded,
                      onPressed: () => onItemPressed(context, index: 3),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);
    AuthController authController = AuthController();
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const NotiTest()));
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
        authController.logoutUser();
        break;
    }
  }
}
