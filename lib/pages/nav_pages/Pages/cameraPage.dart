import 'dart:async';
import 'package:web_socket_channel/io.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../components/rouned_button.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../values/app_colors.dart';
import '../../../pages/nav_pages/Drawer/navigation_drawer.dart';
import '../../../pages/signup_pages/login_screen.dart';
import '../../../pages/nav_pages/Pages/manualPage.dart';
import '../../../pages/nav_pages/Pages/correctPosturePage.dart';
import '../../../pages/nav_pages/Pages/addDevicesPage.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({
    Key? key,
  }) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: WifiCheck(),
      ),
    );
  }
}

class WifiCheck extends StatefulWidget {
  const WifiCheck({Key? key}) : super(key: key);

  @override
  State<WifiCheck> createState() => _WifiCheckState();
}

class _WifiCheckState extends State<WifiCheck> {
  final String targetSSID = "Hoang Huy";
  String _connectionStatus = "Unknown";
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  late bool isTargetSSID;

  get developer => null;

  @override
  void initState() {
    super.initState();
    isTargetSSID = false;
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LoadingFlipping.square(
            borderColor: Colors.cyan,
            size: 100,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  _connectionStatus.toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w300, fontSize: 26.0),
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundedButton(
                  textColor: Colors.white,
                  press: () {
                    isTargetSSID ? _ConnectWebSocket : initConnectivity();
                  },
                  text: isTargetSSID ? "Connect" : "Recheck WIFI",
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
      drawer: const NavigationDrawerLeft(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
    );
  }

  Future<void> _ConnectWebSocket(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 100));

    final channel =
        IOWebSocketChannel.connect(Uri.parse('ws://192.168.4.1:8888'));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => HomeCam(channel: channel),
      ),
    );
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        String wifiName, wifiBSSID, wifiIP;

        try {
          final wifiInfo = await _connectivity.checkConnectivity();
          wifiName = wifiInfo.name;
          // wifiBSSID = wifiInfo.bssid;
          // wifiIP = wifiInfo.ipAddress;
        } on Exception catch (e) {
          print(e.toString());
          wifiName = "Failed to get Wifi Name";
          wifiBSSID = "Failed to get Wifi BSSID";
          wifiIP = "Failed to get Wifi IP";
        }

        setState(() {
          _connectionStatus = '$result';
          // 'Wifi Name: $wifiName\n'
          // 'Wifi BSSID: $wifiBSSID\n'
          // 'Wifi IP: $wifiIP\n';

          isTargetSSID = targetSSID == wifiName;
        });
        break;
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        setState(() => _connectionStatus = result.toString());
        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }
}

class HomeCam extends StatefulWidget {
  final WebSocketChannel channel;
  const HomeCam({super.key, required this.channel});

  @override
  State<HomeCam> createState() => _HomeCamState();
}

class _HomeCamState extends State<HomeCam> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
