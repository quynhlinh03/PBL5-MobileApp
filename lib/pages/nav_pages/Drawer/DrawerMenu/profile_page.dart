import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_assets.dart';
import 'package:pbl5_app/values/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../components/rouned_button.dart';
import '../../../../values/app_colors.dart';
import '../../../../components/textfield_widget.dart';
import '../../navpages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

Future<Future<DocumentSnapshot<Map<String, dynamic>>>> getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final id = prefs.getString("userID");
  final user = FirebaseFirestore.instance.collection("users").doc(id).get();
  return user;
}

class _ProfilePageState extends State<ProfilePage> {
  // final user = getUser();
  final user = FirebaseAuth.instance.currentUser;
  final ref = FirebaseDatabase.instance.ref('users');
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // final token = prefs.getString("userID");
  @override
  Widget build(BuildContext context) {
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
                      // text: '${user?.name}',
                      text: 'Quynh Linh',
                      // text: "${const Text('Linh').data}",
                      enabledValue: true,
                      // text: user.name,
                      // onChanged: (name) => user = user.copy(name: name),
                    ),
                    const SizedBox(height: 18),
                    TextFieldWidget(
                      label: "Email",
                      text: '${user?.email}',
                      enabledValue: false,
                      // text: user.email,
                      // onChanged: (email) => user = user.copy(email: email),
                    ),
                    const SizedBox(height: 18),
                    // const TextFieldWidget(
                    //   label: "Phone number",
                    //   text: "0702642445",
                    // ),
                    // const SizedBox(height: 18),
                    // const TextFieldWidget(
                    //   label: "Day of birth ",
                    //   text: "03/11/2002",
                    // ),
                    // const SizedBox(height: 18),
                    // const TextFieldWidget(
                    //   label: "Gender",
                    //   text: "Male",
                    // ),
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
                )),
          ),
        ],
      )),
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
