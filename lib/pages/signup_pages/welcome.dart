import 'package:flutter/material.dart';
import '../../pages/signup_pages/login_screen.dart';
import '../../values/app_assets.dart';
import '../../values/app_colors.dart';
import '../../values/app_styles.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            color: AppColors.greenGray,
            margin: const EdgeInsets.only(top: 38),
          ),
        ),
        Expanded(
            flex: 2,
            child: Center(
              child: Column(children: [
                const SizedBox(
                  height: 72,
                ),
                const Text('Welcome to CHoCoL', style: AppStyle.bold),
                const SizedBox(
                  height: 19,
                ),
                const Text(
                  "Hệ thống hỗ trợ điều chỉnh tư thế\nngồi làm việc và học tập.",
                  textAlign: TextAlign.center,
                  style: AppStyle.light2,
                ),
                SizedBox(
                  width: 216,
                  height: 215,
                  child: Image.asset(AppAsset.welcome),
                ),
              ]),
            )),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 100,
            ),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.greenGray,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0)),
                    minimumSize: const Size(256, 59),
                  ),
                  child: Text("Login",
                      style: AppStyle.medium.copyWith(
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
