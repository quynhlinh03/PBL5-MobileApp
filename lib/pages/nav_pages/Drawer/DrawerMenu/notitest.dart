import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pbl5_app/modules/notificaiton_module.dart';
import 'package:pbl5_app/values/app_styles.dart';
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
          appBar: AppBar(
            iconTheme: const IconThemeData(color: AppColors.neutral),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              padding: const EdgeInsets.only(top: 25),
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Stack(children: [
            SingleChildScrollView(
              child: Column(children: [
                const SizedBox(height: 40),
                Container(
                    padding: const EdgeInsets.only(left: 25),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "Notifications",
                      style: AppStyle.regular2,
                      textAlign: TextAlign.left,
                    )),
                const SizedBox(height: 30),
                notifications.reversed.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 700,
                            padding: const EdgeInsets.only(top: 10),
                            child: AnimatedList(
                              key: _listKey,
                              initialItemCount: notifications.length,
                              itemBuilder: (context, index, animation) {
                                notificationModel notification =
                                    notifications[index];
                                return SizeTransition(
                                  key: UniqueKey(),
                                  sizeFactor: animation,
                                  child: Card(
                                    elevation: 0,
                                    borderOnForeground: false,
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      tileColor: AppColors.black05,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10),
                                      leading: const Icon(
                                          Icons.info_outline_rounded),
                                      title: Text(
                                        notification.body,
                                      ),
                                      subtitle: Text(notification.time),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.delete_outline),
                                        onPressed: () {
                                          setState(() {
                                            _removeNotification(index);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
              ]),
            )
          ])),
    );
  }
}
