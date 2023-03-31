import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbl5_app/controller/auth_controller.dart';
import '../../components/checksignuplogin.dart';
import '../../components/rouned_button.dart';
import '../../pages/signup_pages/forgotpasscreen.dart';
import '../../pages/signup_pages/signupscreen.dart';
import '../../values/app_assets.dart';
import '../../values/app_styles.dart';
import '../../values/app_colors.dart';
import '../../components/textfieldcontainer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
  
class _LoginScreenState extends State<LoginScreen> {
  bool hide = true;

  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            SizedBox(
              width: 216,
              height: 215,
              child: Image.asset(AppAsset.welcome),
            ),
            //Email
            TextFieldContainer(
              child: TextField(
                controller: authController.loginEmailController,
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
            //Password
            TextFieldContainer(
              child: TextField(
                controller: authController.loginPasswordController,
                obscureText: authController.hide.value,
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.neutral,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      print(authController.hide.value.toString());
                      authController.togglePasswordVisibility();
                    },
                    icon: Obx(() => authController.hide.value
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility)),
                    color: AppColors.neutral,
                  ),
                  hintText: "Password",
                  hintStyle:
                      AppStyle.light2.copyWith(color: AppColors.fontNormal),
                  border: InputBorder.none,
                ),
              ),
            ),
            // Forgot password
            Container(
                padding: EdgeInsets.only(right: size.width * 0.1, top: 10),
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const ForgotPassScreen());
                  },
                  child: Text(
                    'Forgot Password?',
                    style: AppStyle.light1.copyWith(color: AppColors.greenGray),
                  ),
                )),
            // Button Login
            Container(
              margin: const EdgeInsets.only(top: 29),
              alignment: Alignment.center,
              child: RoundedButton(
                press: () {
                  authController.loginUser();
                },
                text: 'Login',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CheckSignUpLogin(
              login: '0',
              press: () {
                Get.to(() => const SignUpScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
