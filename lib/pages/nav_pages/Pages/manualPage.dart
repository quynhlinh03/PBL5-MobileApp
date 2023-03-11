import 'package:flutter/material.dart';
import 'package:pbl5_app/pages/signup_pages/result_forgot.dart';
import '../../../../components/rouned_button.dart';
import '../../../../values/app_styles.dart';
import '../../../../values/app_colors.dart';
import '../../../../components/textfieldcontainer.dart';

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
          leading: const BackButton(color: AppColors.white),
          backgroundColor: AppColors.greenGray,
          elevation: 0,
        ),
        body: ListView(padding: EdgeInsets.zero, children: <Widget>[
          buildTop(),
          buildContent(),
        ]));
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
        )
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
        backgroundColor: AppColors.greenGray,
        // backgroundImage: AssetImage('assets/images/manual.jpg'),
        backgroundImage: const NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxQeDXrL0QAJXo-i-h01SqL-Xwu6yA7pU5rJHaTq36sA&s'),
      );

  Widget buildContent() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: const Text(
              "HƯỚNG DẪN SỬ DỤNG THIẾT BỊ",
              style: AppStyle.mediumblack16,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, top: 30),
            alignment: Alignment.bottomLeft,
            child: const Text(
              "Thiết bị CHoCoL Mirror",
              style: AppStyle.mediumGreen,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, top: 10, right: 20),
            alignment: Alignment.bottomLeft,
            child: const Text(
              "Đặt thiết bị bên cạnh người dùng, ở bên phải hoặc bên trái cách 80-100cm, máy ảnh hướng về phía người dùng.\nCắm cáp Type-C từ Czur Mirror với máy tính hoặc bộ chuyển đổi nguồn và kết nối với app điện thoại.\nLàm theo lời nhắc của giọng nói để nhập tư thế ngồi tiêu chuẩn.\nKhi sử dụng tư thế ngồi chuẩn, hãy đảm bảo rằng bạn phải ngồi thẳng càng nhiều càng tốt và hạ thấp đầu vừa phải.",
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
            padding: const EdgeInsets.only(left: 25, top: 10, right: 20),
            alignment: Alignment.bottomLeft,
            child: const Text(
              "Đặt thiết bị bên cạnh người dùng, ở bên phải hoặc bên trái cách 80-100cm, máy ảnh hướng về phía người dùng.\nCắm cáp Type-C từ Czur Mirror với máy tính hoặc bộ chuyển đổi nguồn và kết nối với app điện thoại.\nLàm theo lời nhắc của giọng nói để nhập tư thế ngồi tiêu chuẩn.\nKhi sử dụng tư thế ngồi chuẩn, hãy đảm bảo rằng bạn phải ngồi thẳng càng nhiều càng tốt và hạ thấp đầu vừa phải.",
              style: AppStyle.light2,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
