import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pages/signup_pages/login_screen.dart';
import '../../values/app_assets.dart';
import '../../values/app_colors.dart';
import '../../values/app_styles.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            color: AppColors.greenGray,
            margin: const EdgeInsets.only(top: 44),
          ),
        ),
        Expanded(
            flex: 3,
            child: Center(
              child: Column(children: [
                SizedBox(
                  width: 216,
                  height: 215,
                  child: Image.asset(AppAsset.welcome),
                ),
                const Text('Successfully !', style: AppStyle.regular2),
                const SizedBox(
                  height: 19,
                ),
                const Text(
                  "Your password has been reset successfully!\nNow login with your new password.",
                  textAlign: TextAlign.center,
                  style: AppStyle.light2,
                ),
              ]),
            )),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 100,
            ),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.offAll(()=> const LoginScreen());
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
