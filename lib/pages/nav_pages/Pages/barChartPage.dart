import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbl5_app/components/bar_chart.dart';
import 'package:pbl5_app/components/bar_chartDay.dart';
import 'package:pbl5_app/components/bar_chartMonth.dart';
import 'package:pbl5_app/components/bar_chartWeek.dart';
import 'package:pbl5_app/pages/nav_pages/Pages/feedBackChartPage.dart';
import 'package:pbl5_app/pages/nav_pages/Pages/feedBackWeekChartPage.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../values/app_colors.dart';
import '../../../pages/nav_pages/Drawer/navigation_drawer.dart';
import 'package:http/http.dart' as http;

class BarChartPage extends StatefulWidget {
  const BarChartPage({Key? key}) : super(key: key);

  @override
  _BarChartPageState createState() => _BarChartPageState();
}

class _BarChartPageState extends State<BarChartPage> {
  int _currentIndex = 0;
  Map<String, double> data = {};
  Map<String, double> dataMonth = {};
  Future<void> getData() async {
    final response = await http.get(Uri.parse(
        'http://192.168.90.130:8000/incorrect_percentage/1/this_week'));

    final responseMonth = await http.get(Uri.parse(
        'http://192.168.90.130:8000/incorrect_percentage/1/this_month'));

    if (response.statusCode == 200) {
      final newData = jsonDecode(response.body);
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
      newDataMonth.forEach((key, value) {
        if (value is num) {
          dataMonth[key] = value.toDouble();
        }
      });
      // sử dụng dữ liệu ở đây
    } else {
      // xử lý lỗi nếu cần
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // canh giữa theo chiều dọc
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Posture Analysis ",
                  style: AppStyle.regular2,
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
                      ? const BarChartWidget(
                          percent: '25',
                          text: 'day',
                          newPage: FeedBackPage(),
                          barPage: BarChartDayComponent(),
                        )
                      : _currentIndex == 1
                          ? BarChartWidget(
                              percent: '50',
                              text: 'week',
                              newPage: FeedBackWeekPage(
                                dataMap: data,
                                text: 'This week',
                              ),
                              barPage: const BarChartWeekComponent(),
                            )
                          : BarChartWidget(
                              percent: '75',
                              text: 'month',
                              newPage: FeedBackWeekPage(
                                dataMap: dataMonth,
                                text: 'This month',
                              ),
                              barPage: const BarChartMonthComponent(),
                            ),
                ),
              ],
            ),
          ),
        ));
  }
}
