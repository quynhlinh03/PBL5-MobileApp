import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_assets.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../../components/rouned_button.dart';
import '../../../../values/app_colors.dart';
import '../../../../components/textfield_widget.dart';
import '../../navpages.dart';

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
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 40),
                child: Column(
                  children: [
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
                    Container(
                      margin: const EdgeInsets.only(top: 29),
                      alignment: Alignment.center,
                      child: RoundedButton(
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const MainPageNav();
                              },
                            ),
                          );
                        },
                        size: const Size(175, 52),
                        text: 'Save',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget headerWidget() {
  return Container(
    decoration: const BoxDecoration(
      color: AppColors.greenGray,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
    ),
    alignment: Alignment.bottomCenter,
    height: 200,
    width: 800,
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(AppAsset.ava),
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
