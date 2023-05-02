import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});
  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  
Widget build(BuildContext context) {
    final isRunning = true;
    return Scaffold(
      appBar: AppBar(
        title: Text('CAMERA'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Mjpeg(
                isLive: isRunning,
                error: (context, error, stack) {
                  print(error);
                  print(stack);
                  return Text(error.toString(), style: TextStyle(color: Colors.red));
                },
                stream:
                'http://192.168.1.2:81/stream',
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}