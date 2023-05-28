import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:pbl5_app/pages/nav_pages/Drawer/navigation_drawer.dart';
import 'package:pbl5_app/values/app_colors.dart';
import 'package:pbl5_app/values/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../modules/notificaiton_module.dart';
import '../../../services/notification_service.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<CameraPage> {
  bool _isRunning = true;
  String url = '';
  String newNotifications = "";
  // Future<void> _initFuture;
  final notifController = NotificationService();
  bool _showProgress = false;
  @override
  void initState() {
    super.initState();
    _showProgress = true;
    initWebSocket();
  }

  _slowMethod() async {
    setState(() {
      _showProgress = true;
    });

    await Future.delayed(const Duration(seconds: 5));

    setState(() {
      _showProgress = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> initWebSocket() async {
    print("init camera");
    try {
      final info = NetworkInfo();
      final String ipAddress = await info.getWifiIP() ?? '';
      if (ipAddress == '') {
        _isRunning = false;
        return false;
      }
      List<String> parts = ipAddress.split('.');
      String firstThreeParts = parts.sublist(0, 3).join('.');

      url = 'http://$firstThreeParts.35:81/stream';
      print(url);

      var response = await http.head(Uri.parse(url));
      await Future.delayed(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        debugPrint('URL is working');
        _isRunning = true;
        return true;
      } else {
        debugPrint('URL is not working');
        _isRunning = false;
        return false;
      }
    } catch (error) {
      print("Error $error");
      _isRunning = false;
      return false;
    }
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
      newNotifications = notificationList[0].body;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavigationDrawerLeft(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              padding: const EdgeInsets.only(top: 15),
              icon: const Icon(
                Icons.menu_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: FutureBuilder<void>(
          future: initWebSocket(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.done ||
                _isRunning) {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      Text(
                        "Camera",
                        style: AppStyle.regular2.copyWith(fontSize: 22),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        alignment: Alignment.center,
                        // padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Column(
                            children: [
                              Transform.rotate(
                                angle: -pi / 2,
                                child: Mjpeg(
                                  isLive: true,
                                  error: (context, error, stack) {
                                    print('Error: $error');
                                    print(stack);
                                    return _showProgress
                                        ? const CircularProgressIndicator()
                                        : const Text(
                                            "The camera is not stream");
                                  },
                                  stream: url,
                                ),
                              ),
                              const SizedBox(
                                height: 70,
                              ),
                              // Text(newNotification);
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError || !_isRunning) {
              return Center(
                child: Column(
                  children: [
                    _showProgress
                        ? const CircularProgressIndicator()
                        : const Text("The camera is not stream"),
                  ],
                ),
              );
            } else {
              return Center(
                child: Column(children: [
                  const SizedBox(height: 10),
                  Text(
                    "Camera",
                    style: AppStyle.regular2.copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 100),
                  // const Future.delayed(Duration(seconds: 5)),
                  _showProgress
                      ? const CircularProgressIndicator()
                      : const Text("No connection"),
                ]),
              );
            }
          }),
    );
  }
}
