import 'package:flutter/material.dart';

import '../../../../modules/notificaiton_module.dart';

class NotiTest extends StatefulWidget {
  // final List<NotificationModel> notifications;

  const NotiTest({super.key});
  @override
  State<NotiTest> createState() => _NotiTestState();
}

class _NotiTestState extends State<NotiTest> with WidgetsBindingObserver {

  List<notificationModel> notifications = [
    notificationModel(title: "Hehe", body: "Chưa xong đâu"),
    notificationModel(title: "Hehe", body: "Chưa xong đâu 1 "),
    notificationModel(title: "Hehe", body: "Chưa xong đâu 2")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Notifications')),
        body: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            var notification = notifications[index];
            return ListTile(
              title: Text(notification.title),
              subtitle: Text(notification.body),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    notifications.removeAt(index);
                    // prefs.setStringList('notificationList', notificationList);
                  });
                },
              ),
            );
          },
        ));
  }
}
