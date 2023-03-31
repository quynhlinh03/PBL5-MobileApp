import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbl5_app/controller/auth_controller.dart';
import '../../components/checksignuplogin.dart';
import '../../components/rouned_button.dart';
import '../../values/app_assets.dart';
import '../../values/app_styles.dart';
import '../../values/app_colors.dart';
import '../../components/textfieldcontainer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hide = true;
  bool confirm = true;

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              SizedBox(
                width: 216,
                height: 215,
                child: Image.asset(AppAsset.welcome),
              ),
              TextFieldContainer(
                child: TextField(
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.account_circle_outlined,
                      color: AppColors.neutral,
                    ),
                    hintText: "Name",
                    hintStyle:
                        AppStyle.light2.copyWith(color: AppColors.fontNormal),
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  controller: authController.emailController,
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
              TextFieldContainer(
                child: TextField(
                  controller: authController.passwordController,
                  obscureText: hide,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.neutral,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          //authController.togglePasswordVisibility();
                          hide = !hide;
                        });
                      },
                      // icon: Obx(() => authController.hide.value
                      //     ? const Icon(Icons.visibility)
                      //     : const Icon(Icons.visibility_off_outlined)),
                      // color: AppColors.neutral,
                      icon: hide
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off_outlined),
                      color: AppColors.neutral,
                    ),
                    hintText: "Password",
                    hintStyle:
                        AppStyle.light2.copyWith(color: AppColors.fontNormal),
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  controller: authController.confirmTextController,
                  obscureText: confirm,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.neutral,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          //authController.toggleConfirmVisibility();
                          confirm = !confirm;
                        });
                      },
                      // icon: Obx(() => authController.hideConfirm.value
                      //     ? const Icon(Icons.visibility)
                      //     : const Icon(Icons.visibility_off_outlined)),
                      // color: AppColors.neutral,
                      icon: confirm
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off_outlined),
                      color: AppColors.neutral,
                    ),
                    hintText: "Confirm Password",
                    hintStyle:
                        AppStyle.light2.copyWith(color: AppColors.fontNormal),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                child: RoundedButton(
                  press: () async {
                    authController.createAccount();
                  },
                  text: 'Signup',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10, top: 10),
                child: CheckSignUpLogin(
                  login: '1',
                  press: () {
                    Get.back();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
