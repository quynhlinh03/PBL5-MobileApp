import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show ClientException;
import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:pbl5_app/pages/nav_pages/Drawer/navigation_drawer.dart';
import 'package:pbl5_app/values/app_colors.dart';
import 'package:pbl5_app/values/app_styles.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<CameraPage> {
  bool _isRunning = false;

  String url = '';

  @override
  void initState() {
    initWebSocket();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initWebSocket() async {
    try {
      final info = NetworkInfo();
      final String ipAddress = await info.getWifiIP() ?? '';
      if (ipAddress == '') {
        _isRunning = false;
      } else {
        List<String> parts = ipAddress.split('.');
        String firstThreeParts = parts.sublist(0, 3).join('.');
        url = 'http://$firstThreeParts.35:81/stream';
        var response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          print('URL is working');
          _isRunning = true;
        } else {
          print('URL is not working');
          _isRunning = false;
        }
      }
    } on HttpException catch (error) {
      throw ClientException(error.message, error.uri);
    } on Exception catch (error) {
      print("Error $error");
    }
  }

  @override
  Widget build(BuildContext context) {
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
            if (snapshot.connectionState == ConnectionState.done) {
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
                      const SizedBox(height: 15),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child:
                              // _isRunning
                              url != '' && _isRunning
                                  ? (() {
                                      try {
                                        return Transform.rotate(
                                          angle: -pi / 2, // Xoay -90 độ
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Mjpeg(
                                              isLive: true,
                                              error: (context, error, stack) {
                                                print('Error: $error');
                                                print(stack);
                                                return const Text('Error');
                                              },
                                              stream: url,
                                            ),
                                          ),
                                        );
                                      } on Exception catch (e) {
                                        _isRunning = false;
                                        print('Error: $e');
                                        return const Text('An error occurred');
                                      }
                                    })()
                                  : const Text('Check connect wifi'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error'));
            } else {
              return Center(
                child: Column(children: [
                  const SizedBox(height: 10),
                  Text(
                    "Camera",
                    style: AppStyle.regular2.copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 100),
                  const CircularProgressIndicator(),
                ]),
              );
            }
          }),
    );
  }
}
