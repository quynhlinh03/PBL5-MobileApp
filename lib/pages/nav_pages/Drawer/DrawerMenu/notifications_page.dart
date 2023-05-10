import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../modules/notificaiton_module.dart';
import '../../../../values/app_colors.dart';
import '../../../../components/custom_notification.dart';
import '../../../../values/app_styles.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<notificationModel> notifications = [];
  @override
  void initState() {
    super.initState();
    _loadData(); // call the async function when the widget is first created
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notificationStrings =
        prefs.getStringList('notifications') ?? [];
    List<notificationModel> notificationList = [];
    for (var notificationString in notificationStrings) {
      var notificationMap = json.decode(notificationString);
      notificationList.add(notificationModel.fromMap(notificationMap));
    }
    setState(() {
      notifications = notificationList;
    });
  }

  Future<void> _removeNotification(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      notifications.removeAt(index);
      List<String> notificationStrings = notifications
          .map((notification) => json.encode(notification.toMap()))
          .toList();
      prefs.setStringList('notifications', notificationStrings);
      _loadData();
    });
  }

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
        child: Container(
          height: notifications.length*90,
          child: notifications.reversed.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        height: 90,
                        color: AppColors.black05,
                        padding: const EdgeInsets.only(
                            left: 27, top: 15, bottom: 15),
                        child: Row(
                          children: [
                            const Flexible(
                              flex: 2,
                              child: Icon(
                                Icons.high_quality_rounded,
                                size: 25,
                                color: AppColors.neutral,
                              ),
                            ),
                            const Flexible(
                              flex: 0,
                              child: SizedBox(width: 27),
                            ),
                            const Flexible(
                              flex: 9,
                              child: Text(
                                "Chơi đồ",
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
                                "${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}",
                                style: AppStyle.regular.copyWith(fontSize: 14),
                              ),
                            ),
                            Flexible(
                                flex: 3,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _removeNotification(index);
                                      });
                                    },
                                    icon: const Icon(Icons.delete)))
                          ],
                        ));
                  },
                ),
        ),
      ),
    );
  }
}
