import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pbl5_app/controller/user_controller.dart';
import 'package:pbl5_app/modules/user_module.dart';
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // final user = getUser();
  final userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.greenGray,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(top: 20),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
          child: FutureBuilder<Users?>(
              future: userController.readUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final user = snapshot.data!;
                  return Column(
                    children: [
                      headerWidget(user),
                      Expanded(
                        child: SingleChildScrollView(
                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 40),
                            child: Column(
                              children: [
                                const SizedBox(height: 18),
                                TextFieldWidget(
                                  label: "Name",
                                  // text: '${user?.name}',
                                  text: user.name,
                                  //text: "${const Text('Linh').data}",
                                  enabledValue: false,
                                  // text: user.name,
                                  // onChanged: (name) => user = user.copy(name: name),
                                ),

                                const SizedBox(height: 18),
                                TextFieldWidget(
                                  label: "Email",
                                  text: user.email,
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
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              })),
    );
  }
}

Widget headerWidget(Users user) {
  return Container(
    decoration: const BoxDecoration(
      color: AppColors.greenGray,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
    ),
    alignment: Alignment.bottomCenter,
    height: 204,
    width: 800,
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: CircleAvatar(
            radius: 60,
            backgroundImage: //AssetImage(AppAsset.ava),
                AssetImage(
                    user.name == 'Linh' ? AppAsset.ava : AppAsset.ava_nam),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 0, top: 16),
            child: Text(
              user.name,
              style: AppStyle.mediumwhite,
              textAlign: TextAlign.left,
            )),
      ],
    ),
  );
  // );
}
