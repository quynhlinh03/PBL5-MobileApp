import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbl5_app/controller/auth_controller.dart';
import '../../components/checksignuplogin.dart';
import '../../components/rouned_button.dart';
import '../../pages/signup_pages/signupscreen.dart';
import '../../values/app_styles.dart';
import '../../values/app_colors.dart';
import '../../components/textfieldcontainer.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    Size size = MediaQuery.of(context).size; //get the screen size
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
                padding: const EdgeInsets.only(left: 25),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "Forgot Password",
                  style: AppStyle.regular2,
                  textAlign: TextAlign.left,
                )),
            const SizedBox(height: 20),
            Container(
                padding: const EdgeInsets.only(left: 27),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "Enter your account email, we will send you a password reset link",
                  style: AppStyle.light1,
                  textAlign: TextAlign.left,
                )),
            const SizedBox(height: 42),
            TextFieldContainer(
              child: TextField(
                controller: authController.resetEmailController,
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.mail_outline_rounded,
                    color: AppColors.neutral,
                  ),
                  hintText: "Email",
                  hintStyle:
                      AppStyle.light2.copyWith(color: AppColors.fontNormal),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 29),
              alignment: Alignment.center,
              child: RoundedButton(
                press: () {
                  authController.resetPassword(context);
                },
                text: 'Confirm',
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 400),
              child: CheckSignUpLogin(
                login: '2',
                press: () {
                  Get.to(() => const SignUpScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
