import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../values/app_colors.dart';
import '../../../pages/nav_pages/Drawer/navigation_drawer.dart';
import '../../../pages/nav_pages/Pages/manualPage.dart';
import '../../../pages/nav_pages/Pages/correctPosturePage.dart';
import '../../../pages/nav_pages/Pages/addDevicesPage.dart';

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
      body: Center(
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
          Container(
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
                        child: const Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 15,
                            bottom: 5,
                          ),
                          child: Text(
                            'Hướng dẫn sử dụng thiết bị',
                            style: AppStyle.mediumblack,
                          ),
                        ),
                      ),
                      Container(
                        child: const Padding(
                          padding: EdgeInsets.only(
                            top: 4,
                            left: 15,
                            bottom: 10,
                          ),
                          child: Text(
                            'Thiết bị hỗ trợ điều chỉnh tư thế, giúp cải thiện ...',
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
                                        return const ManualPage();
                                      },
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.greenGray,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(60.0)),
                                  minimumSize: const Size(74, 35),
                                ),
                                child: const Text("View",
                                    style: AppStyle.mediumwhite16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                      ),
                      color: AppColors.gray,
                    ),
                    child: const SizedBox(height: 170, width: 200),
                  ),
                ),
              ],
            ),
          ),
          Container(
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
                        child: const Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 15,
                            bottom: 5,
                          ),
                          child: Text(
                            'Hướng dẫn tư thế ngồi đúng',
                            style: AppStyle.mediumblack,
                          ),
                        ),
                      ),
                      Container(
                        child: const Padding(
                          padding: EdgeInsets.only(
                            top: 4,
                            left: 15,
                            bottom: 10,
                          ),
                          child: Text(
                            'Thiết bị hỗ trợ điều chỉnh tư thế, giúp cải thiện ...',
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
                                        return const CorrectPosturePage();
                                      },
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.greenGray,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(60.0)),
                                  minimumSize: const Size(74, 35),
                                ),
                                child: const Text("View",
                                    style: AppStyle.mediumwhite16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                      ),
                      color: AppColors.gray,
                    ),
                    child: const SizedBox(height: 170, width: 200),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

// Widget headerWidget2() {
//   const url =
//       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxQeDXrL0QAJXo-i-h01SqL-Xwu6yA7pU5rJHaTq36sA&s";
//   return Container(
//     alignment: Alignment.bottomLeft,
//     padding: EdgeInsets.only(top: 0, left: 0),
//     height: 267,
//     width: 800,
//     color: AppColors.greenGray,
//     child: Column(
//       children: [
//         Container(
//                 padding: const EdgeInsets.only(left: 20,top:10, bottom:10),
//                 alignment: Alignment.bottomLeft,
//                 child: const Text(
//                   "Devices",
//                   style: AppStyle.semibold,
//                   textAlign: TextAlign.left,
//                 )),
//         const SizedBox(height: 20),
//         GestureDetector(
//           onTap: () {
//           // Hành động khi người dùng bấm vào hình ảnh
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => AddDevicesPage()),
//           );
//         },
//         child: Container(
//           child: const SizedBox(height: 160, width:345),
//           decoration: BoxDecoration( borderRadius: BorderRadius.circular(20), color: AppColors.white ),
//             ),
// ),
//       ],
//     ),
//   );
// }
