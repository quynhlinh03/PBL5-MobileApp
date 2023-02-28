import 'package:flutter/material.dart';
import '../values/app_colors.dart';
import '../values/app_styles.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color textColor, background;

  const RoundedButton({
    super.key,
    required this.text,
    required this.press,
    this.textColor = Colors.white,
    this.background = AppColors.greenGray,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
          minimumSize: const Size(256, 59),
        ),
        child: Text(
          text,
          style: AppStyle.medium.copyWith(color: textColor),
        ),
      ),
    );
  }
}
