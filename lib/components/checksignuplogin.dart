import 'package:flutter/material.dart';
import '../values/app_colors.dart';
import '../values/app_styles.dart';

class CheckSignUpLogin extends StatelessWidget {
  final bool login;
  final Function() press;

  const CheckSignUpLogin({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? 'Not a member yet? ' : "Already have an account? ",
          style: AppStyle.light1,
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? 'Sign up' : 'Login',
            style: AppStyle.light1.copyWith(color: AppColors.greenGray),
          ),
        )
      ],
    );
  }
}
