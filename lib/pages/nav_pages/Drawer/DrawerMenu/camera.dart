import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:pbl5_app/components/rouned_button.dart';
import 'package:pbl5_app/components/textfieldcontainer.dart';
import 'package:http/http.dart' as http;
import '../../../../values/app_colors.dart';
import '../../../../values/app_styles.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  final TextEditingController _urlController = TextEditingController();
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CAMERA'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextFieldContainer(
              child: TextField(
                controller: _urlController,
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.neutral,
                  ),
                  hintText: 'URL',
                  hintStyle:
                      AppStyle.light2.copyWith(color: AppColors.fontNormal),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            RoundedButton(
              text: 'Connect',
              press: () async {
                final String url = _urlController.text;
                if (url == "") {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('INVALID URL'),
                        content: const Text('Please enter a valid URL.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  try {
                    // Check if the URL is valid by making a HEAD request to the URL
                    final response = await http.head(Uri.parse('http://$url'));
                    if (response.statusCode == 200) {
                      throw Exception();
                    }
                  } on Exception catch (_, e) {
                    print("Exception: $e");
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Wrong URL'),
                          content: const Text('Please enter a valid URL.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  }

                  // If the URL is valid, set the isRunning state and update the UI
                  setState(() {
                    _isRunning = true;
                    print(true);
                  });
                }
              },
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: _isRunning
                    ? (() {
                        try {
                          return Mjpeg(
                            isLive: true,
                            error: (context, error, stack) {
                              print('Error: $error');
                              print(stack);
                              return const Text('Error');
                            },
                            stream: 'http://${_urlController.text}:81/stream',
                          );
                        } on Exception catch (e) {
                          _isRunning = false;
                          print('Error: $e');
                          return const Text('An error occurred');
                        }
                      })()
                    : const Text(''),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
