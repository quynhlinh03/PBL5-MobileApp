import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../../values/app_colors.dart';
import '../../../../components/textfield_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.greenGray,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            headerWidget(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 40),
                child: Column(
                  children: const [
                    TextFieldWidget(
                      label: "Name",
                      text: "Quynh Linh",
                      // text: user.name,
                      // onChanged: (name) => user = user.copy(name: name),
                    ),
                    SizedBox(height: 18),
                    TextFieldWidget(
                      label: "Email",
                      text: "phamthiquynhlinh3112002@gmail",
                      // text: user.email,
                      // onChanged: (email) => user = user.copy(email: email),
                    ),
                    SizedBox(height: 18),
                    TextFieldWidget(
                      label: "Phone number",
                      text: "0702642445",
                    ),
                    SizedBox(height: 18),
                    TextFieldWidget(
                      label: "Day of birth ",
                      text: "03/11/2002",
                    ),
                    SizedBox(height: 18),
                    TextFieldWidget(
                      label: "Gender",
                      text: "Male",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget headerWidget() {
  const url =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxQeDXrL0QAJXo-i-h01SqL-Xwu6yA7pU5rJHaTq36sA&s";
  return Container(
    decoration: const BoxDecoration(
      color: AppColors.greenGray,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
    ),
    alignment: Alignment.bottomCenter,
    // margin: const EdgeInsets.only(left: 24, top: 40),
    height: 200,
    width: 800,
    // child: Padding(
    //   padding: const EdgeInsets.fromLTRB(24.0, 40, 24, 0),
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: const CircleAvatar(
            radius: 60,
            // backgroundImage: AssetImage('images/ava.jpg'),
            backgroundImage: NetworkImage(url),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 0, top: 16),
            child: const Text(
              "Quynh Linh",
              style: AppStyle.mediumwhite,
              textAlign: TextAlign.left,
            )),
      ],
    ),
  );
  // );
}
