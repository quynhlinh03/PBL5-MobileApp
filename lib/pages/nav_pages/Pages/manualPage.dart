import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_assets.dart';
import '../../../../values/app_styles.dart';
import '../../../../values/app_colors.dart';

class ManualPage extends StatefulWidget {
  const ManualPage({Key? key}) : super(key: key);

  @override
  _ManualPageState createState() => _ManualPageState();
}

class _ManualPageState extends State<ManualPage> {
  final double coverHeight = 115;
  final double profileHeight = 135;

  @override
  Widget build(BuildContext context) {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;
    Size size = MediaQuery.of(context).size; //get the screen size
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            padding: const EdgeInsets.only(top: 25),
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: AppColors.greenGray,
          elevation: 0,
        ),
        body: Column(
          children: [
            buildTop(),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: const Text(
                "INSTRUCTIONS FOR USING THE DEVICE",
                style: AppStyle.mediumblack16,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 25, top: 0),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "CHoCoL Mirror Device",
                        style: AppStyle.mediumGreen,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 25, top: 10, right: 20),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Place the device next to the user, 80-100cm away on the right or left, with the camera facing the user.\nConnect the Type-C cable from the CHoCoL Mirror to the computer or power adapter and connect it to the mobile app.\nUse the camera streaming feature from the mobile app to adjust the seating position to fit the frame of the image.\nWhen using the correct sitting posture, ensure that you sit up straight and lower your head as necessary.\nIf an incorrect sitting posture is detected, the system will issue an alert through the speaker to help the user adjust their posture.",
                        style: AppStyle.light2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, top: 30),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "App CHoCoL Mirror",
                        style: AppStyle.mediumGreen,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 25, top: 10, right: 20, bottom: 20),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Turn on CHoCoL Mirror.\nConnect to WiFi and open the 'CHoCoL' app on your phone.\nRegister an account and log in to the app.\nConnect the app to the device.\nThe app includes main features such as notifications, camera streaming, and posture statistics, as well as other auxiliary functions that help users manage their accounts more conveniently.\nThe notification feature allows the user to receive notifications from the phone instead of the device's speaker.\nThis is useful for working in quiet environments where noise is not allowed.\nThe camera streaming feature helps the user adjust their sitting position and position the camera properly for device recognition.\nThe posture statistics feature tracks correct and incorrect sitting postures by day, week, and month, providing feedback to the user for posture improvement.",
                        style: AppStyle.light2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // const SizedBox(
            //   height: 30,
            // ),
          ],
        ));
  }

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;
    Size size = MediaQuery.of(context).size; //get the screen size
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: AppColors.greenGray,
        child: SizedBox(
          height: coverHeight,
          width: double.infinity,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundImage: const AssetImage(AppAsset.introdcution1),
      );
}
