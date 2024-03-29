import 'package:flutter/material.dart';

import 'package:pbl5_app/values/app_colors.dart';
import 'package:pbl5_app/values/app_styles.dart';

class CustomNotification extends StatelessWidget {
  final String title = "Thông báo";
  final String body;
  final IconData icon;
  final Function() press;
  final DateTime time = DateTime.now();

  CustomNotification({
    Key? key,
    required this.body,
    required this.icon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        color: AppColors.black05,
        padding: const EdgeInsets.only(left: 27, top: 15, bottom: 15),
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: Icon(
                icon,
                size: 25,
                color: AppColors.neutral,
              ),
            ),
            const Flexible(
              flex: 0,
              child: SizedBox(width: 27),
            ),
            Flexible(
              flex: 9,
              child: Text(
                body,
                style: AppStyle.light1,
              ),
            ),
            const Flexible(
              flex: 0,
              child: SizedBox(width: 27),
            ),
            Flexible(
              flex: 3,
              child: Text(
                "${time.hour.toString()}:${time.minute.toString()}",
                style: AppStyle.regular.copyWith(fontSize: 14),
              ),
            ),
            Flexible(
                flex: 3,
                child: IconButton(
                    onPressed: press, icon: const Icon(Icons.delete)))
          ],
        ));
  }
}
