import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pbl5_app/components/bar_chart.dart';
import 'package:pbl5_app/components/bar_chartDay.dart';
import 'package:pbl5_app/components/bar_chartMonth.dart';
import 'package:pbl5_app/components/bar_chartWeek.dart';
import 'package:pbl5_app/pages/nav_pages/Pages/feedBackDayChartPage.dart';
import 'package:pbl5_app/pages/nav_pages/Pages/feedBackChartPage.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../values/app_colors.dart';
import '../../../pages/nav_pages/Drawer/navigation_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:network_info_plus/network_info_plus.dart';

class BarChartPage extends StatefulWidget {
  const BarChartPage({Key? key}) : super(key: key);

  @override
  _BarChartPageState createState() => _BarChartPageState();
}

class _BarChartPageState extends State<BarChartPage> {
  int _currentIndex = 0;
  Map<String, double> data = {};
  Map<String, double> dataMonth = {};
  Map<String, double> acountdataWeek = {};
  List<String> keyWeek = [];
  Map<String, double> acountdataMonth = {};
  List<String> keyMonth = [];
  bool connect = false;
  dynamic averageDay = 0;
  dynamic averageWeek = 0;
  dynamic averageMonth = 0;

  Future<void> getData() async {
    try {
      final info = NetworkInfo();
      final String ipAddress = await info.getWifiIP() ?? '';
      if (ipAddress == '') {
        connect = false;
      } else {
        List<String> parts = ipAddress.split('.');
        String firstThreeParts = parts.sublist(0, 3).join('.');
        final response = await http.get(Uri.parse(
            'http://$firstThreeParts.130:8000/incorrect_percentage/1/this_week'));

        final responseMonth = await http.get(Uri.parse(
            'http://$firstThreeParts.130:8000/incorrect_percentage/1/this_month'));

        final formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
        final responseAverageDay = await http.get(Uri.parse(
            'http://$firstThreeParts.130:8000/accuracy/1/day/$formattedDate'));
        final responseAverageWeek = await http.get(
            Uri.parse('http://$firstThreeParts.130:8000/accuracy/1/this_week'));
        final responseAverageMonth = await http.get(Uri.parse(
            'http://$firstThreeParts.130:8000/accuracy/1/this_month'));

        if (response.statusCode == 200) {
          final newData = jsonDecode(response.body);
          // connect = true;
          newData.forEach((key, value) {
            if (value is num) {
              data[key] = value.toDouble();
            }
          });
          // sử dụng dữ liệu ở đây
        } else {
          // xử lý lỗi nếu cần
        }

        if (responseMonth.statusCode == 200) {
          final newDataMonth = jsonDecode(responseMonth.body);
          // connect = true;
          newDataMonth.forEach((key, value) {
            if (value is num) {
              dataMonth[key] = value.toDouble();
            }
          });
          // sử dụng dữ liệu ở đây
        } else {
          // xử lý lỗi nếu cần
        }

        if (responseAverageDay.statusCode == 200) {
          // connect = true;
          final averDay = jsonDecode(responseAverageDay.body);
          averageDay = averDay["average"];
        } else {
          // xử lý lỗi nếu cần
        }

        if (responseAverageWeek.statusCode == 200) {
          // connect = true;
          final averWeek = jsonDecode(responseAverageWeek.body);
          averageWeek = averWeek["average"];
          Map<String, dynamic> acountWeek = averWeek['items'];
          acountWeek.forEach((key, value) {
            if (value is num) {
              acountdataWeek[key] = value.toDouble();
            } else {
              acountdataWeek[key] = 0;
            }
          });
          keyWeek = acountdataWeek.keys.toList();
        } else {
          // connect = false;
          // xử lý lỗi nếu cần
        }

        if (responseAverageMonth.statusCode == 200) {
          // connect = true;
          final averMonth = jsonDecode(responseAverageMonth.body);
          averageMonth = averMonth["average"];
          Map<String, dynamic> acountMonth = averMonth['items'];
          acountMonth.forEach((key, value) {
            if (value is num) {
              acountdataMonth[key] = value.toDouble();
            } else {
              acountdataMonth[key] = 0;
            }
          });
          keyMonth = acountdataMonth.keys.toList();
        } else {
          connect = false;
          // xử lý lỗi nếu cần
        }
        connect = true;
      }
    } catch (error) {
      connect = false;
      print("Error $error");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerLeft(),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                padding: const EdgeInsets.only(top: 15),
                icon: const Icon(
                  Icons.menu_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: AppColors.white,
          elevation: 0,
        ),
        body: FutureBuilder<void>(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  connect == true) {
                return SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // canh giữa theo chiều dọc
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          "Posture Analysis ",
                          style: AppStyle.regular2.copyWith(fontSize: 22),
                        ),
                        AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            padding: const EdgeInsets.only(top: 35, bottom: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _currentIndex = 0;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0, vertical: 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          bottomLeft: Radius.circular(50)),
                                      color: _currentIndex == 0
                                          ? const Color(0xffEBEBEB)
                                          : AppColors.white,
                                    ),
                                    child: const Text(
                                      "Day",
                                      style: AppStyle.light1,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _currentIndex = 1;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0, vertical: 10.0),
                                    decoration: BoxDecoration(
                                      color: _currentIndex == 1
                                          ? const Color(0xffEBEBEB)
                                          : AppColors.white,
                                    ),
                                    child: const Text(
                                      "Week",
                                      style: AppStyle.light1,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _currentIndex = 2;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0, vertical: 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(50),
                                          bottomRight: Radius.circular(50)),
                                      color: _currentIndex == 2
                                          ? const Color(0xffEBEBEB)
                                          : AppColors.white,
                                    ),
                                    child: const Text(
                                      "Month",
                                      style: AppStyle.light1,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          child: _currentIndex == 0
                              ? BarChartWidget(
                                  percent: '${averageDay.toStringAsFixed(0)}',
                                  text: 'day',
                                  newPage: const FeedBackPage(),
                                  barPage: const BarChartDayComponent(),
                                )
                              : _currentIndex == 1
                                  ? BarChartWidget(
                                      percent:
                                          '${averageWeek.toStringAsFixed(0)}',
                                      text: 'week',
                                      newPage: FeedBackWeekPage(
                                        dataMap: data,
                                        text:
                                            '${keyWeek[0]}  -  ${keyWeek[keyWeek.length - 1]}',
                                      ),
                                      barPage: const BarChartWeekComponent(),
                                    )
                                  : BarChartWidget(
                                      percent:
                                          '${averageMonth.toStringAsFixed(0)}',
                                      text: 'month',
                                      newPage: FeedBackWeekPage(
                                        dataMap: dataMonth,
                                        text:
                                            '${keyMonth[0]}  -  ${keyMonth[keyMonth.length - 1]}',
                                      ),
                                      barPage: const BarChartMonthComponent(),
                                    ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error'));
              } else {
                return Center(
                  child: Column(children: [
                    const SizedBox(height: 10),
                    Text(
                      "Posture Analysis",
                      style: AppStyle.regular2.copyWith(fontSize: 22),
                    ),
                    const SizedBox(height: 100),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    ),
                  ]),
                );
              }
            }));
  }
}
