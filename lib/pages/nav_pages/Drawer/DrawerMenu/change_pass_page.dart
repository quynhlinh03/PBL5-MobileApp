import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbl5_app/pages/signup_pages/success_page.dart';
import '../../../../components/rouned_button.dart';
import '../../../../values/app_styles.dart';
import '../../../../values/app_colors.dart';
import '../../../../components/textfieldcontainer.dart';

class ChangePassPage extends StatefulWidget {
  const ChangePassPage({Key? key}) : super(key: key);

  @override
  _ChangePassPageState createState() => _ChangePassPageState();
}

class _ChangePassPageState extends State<ChangePassPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //get the screen size
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController oldPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    @override
    void dispose() {
      // Dispose the TextEditingController instances when the widget is disposed
      newPasswordController.dispose();
      oldPasswordController.dispose();
      confirmPasswordController.dispose();
      super.dispose();
    }

    final FirebaseAuth auth = FirebaseAuth.instance;
    final currentUser = FirebaseAuth.instance.currentUser;
    changePassword({email, oldPassword, newPassword, confirmPassword}) async {
      if (newPassword == confirmPassword) {
        var cred =
            EmailAuthProvider.credential(email: email, password: oldPassword);
        await currentUser!.reauthenticateWithCredential(cred).then((value) {
          currentUser.updatePassword(newPassword);
          // Chuyển sang trang SuccessPage nếu đổi mật khẩu thành công
          Get.to(() => const SuccessPage());
        }).catchError((error) {
          print(error.toString());
          Get.snackbar(
              'Error', 'Failed to change password. Please try again later.');
        });
      } else {
        Get.snackbar('Error', 'Passwords do not match.');
      }
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.neutral),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(top: 25),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                  padding: const EdgeInsets.only(left: 25),
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Change Password",
                    style: AppStyle.regular2,
                    textAlign: TextAlign.left,
                  )),
              const SizedBox(height: 20),
              Container(
                  padding: const EdgeInsets.only(left: 27),
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Set the new password for your account ",
                    style: AppStyle.light1,
                    textAlign: TextAlign.left,
                  )),
              const SizedBox(height: 42),
              TextFieldContainer(
                child: TextField(
                  controller: oldPasswordController,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.neutral,
                    ),
                    hintText: "Current Password",
                    hintStyle:
                        AppStyle.light2.copyWith(color: AppColors.fontNormal),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              TextFieldContainer(
                child: TextField(
                  controller: newPasswordController,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.neutral,
                    ),
                    hintText: "New Password",
                    hintStyle:
                        AppStyle.light2.copyWith(color: AppColors.fontNormal),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              TextFieldContainer(
                child: TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.neutral,
                    ),
                    hintText: "Confirm Password",
                    hintStyle:
                        AppStyle.light2.copyWith(color: AppColors.fontNormal),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(top: 39),
                alignment: Alignment.center,
                child: RoundedButton(
                  press: () async {
                    await changePassword(
                      email: currentUser?.email,
                      oldPassword: oldPasswordController.text,
                      newPassword: newPasswordController.text,
                      confirmPassword: confirmPasswordController.text,
                    );
                  },
                  text: 'Change Password',
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
