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
              "H?????NG D???N S??? D???NG THI???T B???",
              style: AppStyle.mediumblack16,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, top: 30),
            alignment: Alignment.bottomLeft,
            child: const Text(
              "Thi???t b??? CHoCoL Mirror",
              style: AppStyle.mediumGreen,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, top: 10, right: 20),
            alignment: Alignment.bottomLeft,
            child: const Text(
              "?????t thi???t b??? b??n c???nh ng?????i d??ng, ??? b??n ph???i ho???c b??n tr??i c??ch 80-100cm, m??y ???nh h?????ng v??? ph??a ng?????i d??ng.\nC???m c??p Type-C t??? Czur Mirror v???i m??y t??nh ho???c b??? chuy???n ?????i ngu???n v?? k???t n???i v???i app ??i???n tho???i.\nL??m theo l???i nh???c c???a gi???ng n??i ????? nh???p t?? th??? ng???i ti??u chu???n.\nKhi s??? d???ng t?? th??? ng???i chu???n, h??y ?????m b???o r???ng b???n ph???i ng???i th???ng c??ng nhi???u c??ng t???t v?? h??? th???p ?????u v???a ph???i.",
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
              "?????t thi???t b??? b??n c???nh ng?????i d??ng, ??? b??n ph???i ho???c b??n tr??i c??ch 80-100cm, m??y ???nh h?????ng v??? ph??a ng?????i d??ng.\nC???m c??p Type-C t??? Czur Mirror v???i m??y t??nh ho???c b??? chuy???n ?????i ngu???n v?? k???t n???i v???i app ??i???n tho???i.\nL??m theo l???i nh???c c???a gi???ng n??i ????? nh???p t?? th??? ng???i ti??u chu???n.\nKhi s??? d???ng t?? th??? ng???i chu???n, h??y ?????m b???o r???ng b???n ph???i ng???i th???ng c??ng nhi???u c??ng t???t v?? h??? th???p ?????u v???a ph???i.",
              style: AppStyle.light2,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
