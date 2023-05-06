import 'package:flutter/material.dart';
import '../../../../values/app_colors.dart';
import '../../../../values/app_styles.dart';
import '../../../../components/custom_notification.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.neutral),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(top: 20),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 24, left: 25),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "Notifications",
                  style: AppStyle.regular2,
                  textAlign: TextAlign.left,
                )),
            const SizedBox(height: 40),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.only(left: 27),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "Today",
                      style: AppStyle.regular18,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 18),
                  CustomNotification(
                    icon: Icons.priority_high_rounded,
                    title: "Thông báo",
                    body: 'Bạn đã ngồi sai, hãy điều chỉnh lại tư thế',
                  ),
                  const SizedBox(height: 42),
                  Container(
                    padding: const EdgeInsets.only(left: 27),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "03.11.2023",
                      style: AppStyle.regular18,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 18),
                  CustomNotification(
                    icon: Icons.priority_high_rounded,
                    title: "Thông báo",
                    body: 'Bạn đã ngồi sai, hãy điều chỉnh lại tư thế',
                  ),
                  CustomNotification(
                    icon: Icons.priority_high_rounded,
                    title: "Thông báo",
                    body: 'Bạn đã ngồi sai, hãy điều chỉnh lại tư thế',
                  ),
                  CustomNotification(
                    icon: Icons.priority_high_rounded,
                    title: "Thông báo",
                    body: 'Bạn đã ngồi sai, hãy điều chỉnh lại tư thế',
                  ),
                ]),
              ),
            ),
            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
