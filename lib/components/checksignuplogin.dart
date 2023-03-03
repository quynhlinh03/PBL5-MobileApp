import 'package:flutter/material.dart';
import '../values/app_colors.dart';
import '../values/app_styles.dart';

class CheckSignUpLogin extends StatelessWidget {
  final login;
  final Function() press;

  const CheckSignUpLogin({
    Key? key,
    this.login = '0',
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          (login == '0')
              ? 'Not a member yet? '
              : ((login == '1')
                  ? 'Already have an account? '
                  : 'Don’t have an account? Please '),
          style: AppStyle.light1,
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            (login == '0') ? 'Sign up' : ((login == '1') ? 'Login' : 'Sign up'),
            style: AppStyle.light1.copyWith(color: AppColors.greenGray),
          ),
        )
      ],
    );
  }
}
