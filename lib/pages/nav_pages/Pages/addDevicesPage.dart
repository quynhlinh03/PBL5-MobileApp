import 'package:flutter/material.dart';
import '../../../../values/app_styles.dart';
import '../../../../values/app_colors.dart';

class AddDevicesPage extends StatefulWidget {
  const AddDevicesPage({Key? key}) : super(key: key);

  @override
  _AddDevicesPageState createState() => _AddDevicesPageState();
}

class _AddDevicesPageState extends State<AddDevicesPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //get the screen size
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.only(top: 25),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.neutral,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 0, top: 0),
                child: const Text(
                  "Devices",
                  style: AppStyle.medium23,
                )),
            const SizedBox(height: 115),
            Container(
              width: 380,
              height: 433,
              color: AppColors.greenGray,
              child: Column(
                children: [
                  const SizedBox(height: 65),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    // child: Image.asset('assets/images/add_icon.jpg'),
                    child: IconButton(
                      icon: const Icon(Icons.add_circle_outline_rounded),
                      color: Colors.white,
                      iconSize: 40,
                      onPressed: () {
                        // Hành động khi người dùng bấm vào icon
                      },
                    ),
                  ),
                  Container(
                      child: Text(
                    "Tap to add devices",
                    style: AppStyle.regular18
                        .copyWith(height: 1.5, color: AppColors.white),
                  )),
                  Container(
                      padding: const EdgeInsets.only(top: 14),
                      child: Text(
                        "1. Tap and hold the top Indicator for \n8 seconds.\n2. When the indicator is flashing in blue\n and while alternatively, tap the\n button to add a device",
                        style: AppStyle.light2.copyWith(
                            fontSize: 16,
                            height: 1.4,
                            color: AppColors.whiteBlur),
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
