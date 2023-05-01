import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NotitestList extends StatefulWidget {
  const NotitestList({super.key});

  @override
  _NotitestListState createState() => _NotitestListState();
}

class _NotitestListState extends State<NotitestList> {
  List<String> notifications = [];

  @override
  void initState() {
    super.initState();
    loadNotifications();
  }

  void loadNotifications() async {
    const storage = FlutterSecureStorage();
    // Lấy danh sách thông báo từ SharedPreferences và cập nhật lại danh sách
    List<String> notificationList = [];
    for (int i = 1; i <= 10; i++) {
      String? notification = await storage.read(key: 'notification$i');
      notificationList.add(notification!);
    }
    setState(() {
      notifications = notificationList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách thông báo'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(notifications[index]),
          );
        },
      ),
    );
  }
}
