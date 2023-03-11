import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_assets.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../values/app_colors.dart';
import '../../../pages/signup_pages/login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const NavigationDrawerLeft(),
      // appBar: AppBar(
      //   backgroundColor: AppColors.greenGray,
      //   leading: IconButton(
      //     icon: const Icon(Icons.add),
      //     // alignment: Alignment.topRight,
      //     onPressed: () {
      //       // Navigator.pop(context);
      //     },
      //   ),
      // ),
      body: Container(
        child: Center(
            child: Column(
          children: [
            headerWidget2(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  RowViewIndex(
                    title: 'Hướng dẫn sử dụng thiết bị',
                    decription:
                        'Thiết bị hỗ trợ điều chỉnh tư thế, giúp cải thiện',
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ),
                      );
                    },
                    image: AppAsset.introdcution1,
                  ),
                  RowViewIndex(
                      title: 'Hướng dẫn tư thế ngồi đúng',
                      decription:
                          'Thiết bị hỗ trợ điều chỉnh tư thế, giúp cải thiện ...',
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const LoginScreen();
                            },
                          ),
                        );
                      },
                      image: AppAsset.introdcution2)
                ]),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class RowViewIndex extends StatelessWidget {
  final String title;
  final String decription;
  final Function() press;
  final String image;

  const RowViewIndex({
    super.key,
    required this.title,
    required this.decription,
    required this.press,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 15,
                      bottom: 5,
                    ),
                    child: Text(
                      title,
                      style: AppStyle.mediumblack,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 4,
                      left: 15,
                      bottom: 10,
                    ),
                    child: Text(
                      decription,
                      style: AppStyle.light1,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 15,
                    ),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const LoginScreen();
                                },
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.greenGray,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60.0)),
                            minimumSize: const Size(74, 35),
                          ),
                          child:
                              const Text("View", style: AppStyle.mediumwhite16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  bottomLeft: Radius.circular(32)),
              child: Image.asset(image),
            ),
          ),
        ],
      ),
    );
  }
}

Widget headerWidget2() {
  const url =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxQeDXrL0QAJXo-i-h01SqL-Xwu6yA7pU5rJHaTq36sA&s";
  return Container(
    alignment: Alignment.bottomLeft,
    padding: const EdgeInsets.only(top: 0, left: 0),
    height: 267,
    width: 800,
    color: AppColors.greenGray,
    child: Column(
      children: [
        Container(
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            alignment: Alignment.bottomLeft,
            child: const Text(
              "Devices",
              style: AppStyle.semibold,
              textAlign: TextAlign.left,
            )),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: AppColors.white),
          child: const SizedBox(height: 160, width: 345),
          // width: 250,
          // child: Image.network(
          //     'https://images.pexels.com/photos/34088/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
        )
      ],
    ),
  );
  // );
}
