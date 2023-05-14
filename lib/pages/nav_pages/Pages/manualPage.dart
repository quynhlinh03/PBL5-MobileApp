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
                        "Đặt thiết bị bên cạnh người dùng, ở bên phải hoặc bên trái cách 80-100cm, máy ảnh hướng về phía người dùng.\nCắm cáp Type-C từ CHoCoL Mirror với máy tính hoặc bộ chuyển đổi nguồn và kết nối với app điện thoại.\nLàm theo lời nhắc của giọng nói để nhập tư thế ngồi tiêu chuẩn.\nKhi sử dụng tư thế ngồi chuẩn, hãy đảm bảo rằng bạn phải ngồi thẳng và hạ thấp đầu vừa phải.\nĐặt thiết bị bên cạnh người dùng, ở bên phải hoặc bên trái cách 80-100cm, máy ảnh hướng về phía người dùng.\nCắm cáp Type-C từ CHoCoL Mirror với máy tính hoặc bộ chuyển đổi nguồn và kết nối với app điện thoại.\nLàm theo lời nhắc của giọng nói để nhập tư thế ngồi tiêu chuẩn.\nKhi sử dụng tư thế ngồi chuẩn, hãy đảm bảo rằng bạn phải ngồi thẳng càng nhiều càng tốt và hạ thấp đầu vừa phải.",
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
                      padding:
                          const EdgeInsets.only(left: 25, top: 10, right: 20),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Bật CHoCoL Mirror\nBật Bluetooth trên điện thoại của bạn rồi mở ứng dụng “CHoCoL”\nChạm vào biểu tượng “+” ở góc bên phải phía bên trên của trang chủ của ứng dụng “CHoCoL”. Sau đó chọn CHoCoL Mirror\nNhấn và giữ nút cảm ứng trên CHoCoL Mirror trong 8 giây để kết nối bluetooth với điện thoại.\nỨng dụng của CHoCoL sẽ tìm kiếm thiết bị kết nối (quá trình tìm kiếm sẽ kéo dài trong khoảng 45 giây). Nếu không tìm thấy CHoCoL Mirror, hãy nhấn vào nút “Connect Now” để kết nối lại thiết bị.\nKhi CHoCoL Mirror được kết nối thành công, cso thể vào trang chủ của ứng dụng để sử dụng thiết bị chống gù.",
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
