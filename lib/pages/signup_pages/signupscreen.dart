import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbl5_app/controller/auth_controller.dart';
import 'package:pbl5_app/pages/signup_pages/login_screen.dart';
import '../../components/checksignuplogin.dart';
import '../../components/rouned_button.dart';
import '../../values/app_assets.dart';
import '../../values/app_styles.dart';
import '../../values/app_colors.dart';
import '../../components/textfieldcontainer.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   leading: BackButton(color: AppColors.neutral),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      // body: Column(),
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
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.neutral,
                    ),
                    // suffixIcon: IconButton(
                    //   icon: hide?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                    //   color: AppColors.neutral,
                    //   onPressed: () { 
                    //     setState(() {
                    //       hide = !hide;
                    //     });
                    //    },
                    // ),
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
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.neutral,
                    ),
                    // suffixIcon: IconButton(
                    //   icon: hide?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                    //   color: AppColors.neutral,
                    //   onPressed: () { 
                    //     setState(() {
                    //       hide = !hide;
                    //     });
                    //    },
                    // ),
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
                margin: const EdgeInsets.only(bottom: 10,top:10),
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
