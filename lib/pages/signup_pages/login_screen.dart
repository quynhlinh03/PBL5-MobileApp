import 'package:flutter/material.dart';
import 'package:pbl5_app/components/checksignuplogin.dart';
import 'package:pbl5_app/components/rouned_button.dart';
import 'package:pbl5_app/pages/nav_pages/navpages.dart';
import 'package:pbl5_app/pages/signup_pages/forgotpasscreen.dart';
import 'package:pbl5_app/pages/signup_pages/signupscreen.dart';
import 'package:pbl5_app/values/app_assets.dart';
import 'package:pbl5_app/values/app_colors.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../components/textfieldcontainer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: AppColors.neutral),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            SizedBox(
              child: Image.asset(AppAsset.welcome),
              width: 216,
              height: 215,
            ),
            TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.mail_outline_rounded,
                    color: AppColors.neutral,
                  ),
                  hintText: "Email",
                  hintStyle:
                      AppStyle.light1.copyWith(color: AppColors.fontNormal),
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.neutral,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: AppColors.neutral,
                  ),
                  hintText: "Password",
                  hintStyle:
                      AppStyle.light1.copyWith(color: AppColors.fontNormal),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.only(right: size.width * 0.1, top: 10),
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ForgotPassScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: AppStyle.light1.copyWith(color: AppColors.greenGray),
                  ),
                )),
            Container(
              margin: EdgeInsets.only(top: 29),
              alignment: Alignment.center,
              child: RoundedButton(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MainPageNav();
                      },
                    ),
                  );
                },
                text: 'Login',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CheckSignUpLogin(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
