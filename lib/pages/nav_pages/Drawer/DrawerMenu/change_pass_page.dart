import 'package:flutter/material.dart';
import 'package:pbl5_app/pages/signup_pages/result_forgot.dart';
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
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.neutral,
                  ),
                  hintText: "Curent Password",
                  hintStyle:
                      AppStyle.light2.copyWith(color: AppColors.fontNormal),
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
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
            TextFieldContainer(
              child: TextField(
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
            Container(
              margin: EdgeInsets.only(top: 39),
              alignment: Alignment.center,
              child: RoundedButton(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SuccessPage();
                      },
                    ),
                  );
                },
                text: 'Change Password',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
