import 'package:flutter/material.dart';
import 'package:pbl5_app/data/SharedPref/shared_pref.dart';
import '../../components/checksignuplogin.dart';
import '../../components/rouned_button.dart';
import '../../data/Model/user_model.dart';
import '../../pages/nav_pages/navpages.dart';
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
  SharedPref sharedPref = SharedPref();
  late Users userSave;
  late Users userLoad;

  loadSharedPrefs() async {
    Users user = Users.fromJson(await sharedPref.read("user"));
    setState(() {
      userLoad = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   leading: BackButton(color: AppColors.neutral),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            SizedBox(
              width: 216,
              height: 215,
              child: Image.asset(AppAsset.welcome),
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
                      AppStyle.light2.copyWith(color: AppColors.fontNormal),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    userSave.email = value;
                  });
                },
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
                  suffixIcon: const Icon(
                    Icons.visibility,
                    color: AppColors.neutral,
                  ),
                  hintText: "Password",
                  hintStyle:
                      AppStyle.light2.copyWith(color: AppColors.fontNormal),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    userSave.password = value;
                  });
                },
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
                          return const ForgotPassScreen();
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
              margin: const EdgeInsets.only(top: 29),
              alignment: Alignment.center,
              child: RoundedButton(
                press: () {
                  sharedPref.save("user", userSave);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const MainPageNav();
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
              login: '0',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpScreen();
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
