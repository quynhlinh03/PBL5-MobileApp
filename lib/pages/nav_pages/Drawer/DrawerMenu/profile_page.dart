import 'package:flutter/material.dart';
import 'package:pbl5_app/pages/nav_pages/Drawer/DrawerMenu/notifications_page.dart';
import 'package:pbl5_app/pages/signup_pages/login_screen.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../../pages/nav_pages/Drawer/DrawerMenu/change_pass_page.dart';
import '../../../../pages/nav_pages/Drawer/DrawerMenu/profile_page.dart';
import '../../../../pages/nav_pages/Drawer/DrawerMenu/setting_page.dart';
import '../../../../pages/nav_pages/Drawer/Items/drawer_item.dart';
import '../../../../values/app_colors.dart';
import '../../../../components/textfield_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.greenGray,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            headerWidget(),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(height: 18),
            const TextFieldWidget(
              label: "Name",
              text: "Quynh Linh",
              // text: user.name,
              // onChanged: (name) => user = user.copy(name: name),
            ),
            const SizedBox(height: 18),
            const TextFieldWidget(
              label: "Email",
              text: "phamthiquynhlinh3112002@gmail",
              // text: user.email,
              // onChanged: (email) => user = user.copy(email: email),
            ),
            const SizedBox(height: 18),
            const TextFieldWidget(
              label: "Phone number",
              text: "0702642445",
            ),
            const SizedBox(height: 18),
            const TextFieldWidget(
              label: "Day of birth ",
              text: "03/11/2002",
            ),
            const SizedBox(height: 18),
            const TextFieldWidget(
              label: "Gender",
              text: "Male",
            ),
          ],
        ),
      ),
    );
  }
}

Widget headerWidget() {
  const url =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxQeDXrL0QAJXo-i-h01SqL-Xwu6yA7pU5rJHaTq36sA&s";
  return Container(
    alignment: Alignment.bottomCenter,
    // margin: const EdgeInsets.only(left: 24, top: 40),
    height: 200,
    width: 800,
    color: AppColors.greenGray,
    // child: Padding(
    //   padding: const EdgeInsets.fromLTRB(24.0, 40, 24, 0),
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 0, top: 40),
          child: const CircleAvatar(
            radius: 40,
            // backgroundImage: AssetImage('images/ava.jpg'),
            backgroundImage: NetworkImage(url),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 0, top: 16),
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
