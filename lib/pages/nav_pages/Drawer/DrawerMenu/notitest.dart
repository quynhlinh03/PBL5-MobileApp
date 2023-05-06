import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbl5_app/modules/notificaiton_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotiTest extends StatefulWidget {
  const NotiTest({super.key});
  @override
  State<NotiTest> createState() => _NotiTestState();
}

class _NotiTestState extends State<NotiTest> {
  List<notificationModel> notifications = [];

  @override
  void initState() {
    super.initState();
    _loadData(); // call the async function when the widget is first created
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 1));
    setState(() async {
      List<String> notificationStrings =
          prefs.getStringList('notifications') ?? [];
      for (var notificationString in notificationStrings) {
        var notificationMap = json.decode(notificationString);
        notifications.add(notificationModel.fromMap(notificationMap));
      }
    });
  }

  Future<void> _removeNotification(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      notifications.removeAt(index);
      List<String> notificationStrings = notifications.map((notification) => json.encode(notification.toMap())).toList();
      prefs.setStringList('notifications',notificationStrings);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Notifications')),
        body: notifications.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  notificationModel notification = notifications[index];
                  return ListTile(
                    title: Text(notification.title),
                    subtitle: Text(notification.body),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() async {
                          _removeNotification(index);
                        });
                      },
                    ),
                  );
                },
              ));
  }
}
