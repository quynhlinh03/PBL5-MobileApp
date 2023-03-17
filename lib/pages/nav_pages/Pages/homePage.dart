import 'package:flutter/material.dart';
import 'package:pbl5_app/pages/nav_pages/Pages/correctPosturePage.dart';
import 'package:pbl5_app/values/app_assets.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../components/row_view_index.dart';
import '../../../values/app_colors.dart';
import '../../../pages/nav_pages/Drawer/navigation_drawer.dart';
import 'addDevicesPage.dart';
import 'manualPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerLeft(),
      appBar: AppBar(
        backgroundColor: AppColors.greenGray,
        elevation: 0,
      ),
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
            // headerWidget2(),
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(top: 0, left: 0),
              height: 267,
              width: 800,
              color: AppColors.greenGray,
              child: Column(
                children: [
                  Container(
                      padding:
                          const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Devices",
                        style: AppStyle.semibold,
                        textAlign: TextAlign.left,
                      )),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // Hành động khi người dùng bấm vào hình ảnh
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddDevicesPage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.white),
                      child: const SizedBox(height: 160, width: 345),
                    ),
                  ),
                ],
              ),
            ),
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
                            return const ManualPage();
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
                              return const CorrectPosturePage();
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
