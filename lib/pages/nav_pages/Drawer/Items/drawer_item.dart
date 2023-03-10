import 'package:flutter/material.dart';
import '../../../../values/app_colors.dart';
import '../../../../values/app_styles.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {Key? key,
      required this.name,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: AppColors.greenGrayLight1,
      onTap: onPressed,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Icon(
              icon,
              size: 25,
              color: AppColors.neutral,
            ),
            const SizedBox(
              width: 24,
            ),
            Text(
              name,
              style: AppStyle.regular.copyWith(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
