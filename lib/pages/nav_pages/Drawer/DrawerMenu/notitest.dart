import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pbl5_app/modules/notificaiton_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../values/app_colors.dart';

class NotiTest extends StatefulWidget {
  const NotiTest({super.key});
  @override
  State<NotiTest> createState() => _NotiTestState();
}

class _NotiTestState extends State<NotiTest> {
  List<notificationModel> notifications = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
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
      print("load data");
      notifications = notificationList;
    });
  }

  Future<void> _removeNotification(int index) async {
    print(index);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // add check for valid index
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => SizeTransition(
        key: UniqueKey(),
        sizeFactor: animation,
        child: Card(
          elevation: 0,
          borderOnForeground: true,
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            tileColor: AppColors.whiteBlur,
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            leading: const Icon(Icons.priority_high_rounded),
            title: const Text("Deleted"),
          ),
        ),
      ),
      duration: const Duration(milliseconds: 250),
    );
    notifications.removeAt(index);
    List<String> notificationStrings = notifications
        .map((notification) => json.encode(notification.toMap()))
        .toList();
    prefs.setStringList('notifications', notificationStrings);
  }

  @override
  Widget build(BuildContext context) {
    // pull screen to refresh
    return RefreshIndicator(
      onRefresh: () async {
        _loadData();
      },
      child: Scaffold(
          appBar: AppBar(title: const Text('Notifications')),
          body: notifications.reversed.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding: const EdgeInsets.all(10),
                  child: AnimatedList(
                    key: _listKey,
                    initialItemCount: notifications.length,
                    itemBuilder: (context, index, animation) {
                      notificationModel notification = notifications[index];
                      return SizeTransition(
                        key: UniqueKey(),
                        sizeFactor: animation,
                        child: Card(
                          elevation: 0,
                          borderOnForeground: true,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            tileColor: AppColors.black05,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10),
                            leading: const Icon(Icons.priority_high_rounded),
                            title: Text(notification.title),
                            subtitle: Text(notification.body),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  print("remove");
                                  _removeNotification(index);
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
    );
  }
}
