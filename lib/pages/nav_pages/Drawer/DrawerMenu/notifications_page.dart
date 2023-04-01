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
                padding: const EdgeInsets.only(left: 25),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "Notifications",
                  style: AppStyle.regular2,
                  textAlign: TextAlign.left,
                )),
            const SizedBox(height: 44),
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
                  const CustomNotification(
                      icon: Icons.priority_high_rounded,
                      name: 'Bạn đã ngồi sai, hãy điều chỉnh lại tư thế',
                      time: '07:00 AM'),
                  const CustomNotification(
                      icon: Icons.priority_high_rounded,
                      name: 'Bạn đã ngồi sai, hãy điều chỉnh lại tư thế',
                      time: '08:00 AM'),
                  const CustomNotification(
                      icon: Icons.priority_high_rounded,
                      name: 'Bạn đã ngồi sai, hãy điều chỉnh lại tư thế',
                      time: '09:00 AM'),
                  const CustomNotification(
                      icon: Icons.priority_high_rounded,
                      name: 'Bạn đã ngồi sai, hãy điều chỉnh lại tư thế',
                      time: '10:00 AM'),
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
                  const CustomNotification(
                      icon: Icons.priority_high_rounded,
                      name: 'Bạn đã ngồi sai, hãy điều chỉnh lại tư thế',
                      time: '07:00 AM'),
                  const CustomNotification(
                      icon: Icons.priority_high_rounded,
                      name: 'Bạn đã ngồi sai, hãy điều chỉnh lại tư thế',
                      time: '08:00 PM'),
                  const CustomNotification(
                      icon: Icons.priority_high_rounded,
                      name: 'Bạn đã ngồi sai, hãy điều chỉnh lại tư thế',
                      time: '05:00 AM'),
                  const CustomNotification(
                      icon: Icons.priority_high_rounded,
                      name: 'Bạn đã ngồi sai, hãy điều chỉnh lại tư thế',
                      time: '05:00 AM'),
                  const CustomNotification(
                      icon: Icons.priority_high_rounded,
                      name: 'Bạn đã ngồi sai, hãy điều chỉnh lại tư thế',
                      time: '05:00 AM'),
                ]),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
