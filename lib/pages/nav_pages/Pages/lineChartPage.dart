import 'package:flutter/material.dart';
import 'package:pbl5_app/components/chart.dart';
import 'package:pbl5_app/components/line_chartMonth.dart';
import 'package:pbl5_app/components/line_chartWeek.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../components/legend.dart';
import '../../../components/line_chart.dart';
import '../../../values/app_colors.dart';
import '../../../pages/nav_pages/Drawer/navigation_drawer.dart';

class LineChartPage extends StatefulWidget {
  const LineChartPage({Key? key}) : super(key: key);

  @override
  _LineChartPageState createState() => _LineChartPageState();
}

class _LineChartPageState extends State<LineChartPage> {
  Map<String, double> dataMap = {
    "Wrong": 7.5,
    "Correct": 2.5,
  };
  List<Color> colorList = [
    AppColors.skin,
    AppColors.darkGreen,
  ];
  @override
  int _currentIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationDrawerLeft(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: AppColors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // canh giữa theo chiều dọc
              children: [
                Container(
                    child: Text(
                  "Posture Analysis ",
                  style: AppStyle.regular.copyWith(fontSize: 20),
                )),
                AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    padding: EdgeInsets.only(top: 28, bottom: 3),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  bottomLeft: Radius.circular(50)),
                              color: _currentIndex == 0
                                  ? Color(0xffEBEBEB)
                                  : AppColors.white,
                            ),
                            child: Text(
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              color: _currentIndex == 1
                                  ? Color(0xffEBEBEB)
                                  : AppColors.white,
                            ),
                            child: Text(
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50)),
                              color: _currentIndex == 2
                                  ? Color(0xffEBEBEB)
                                  : AppColors.white,
                            ),
                            child: Text(
                              "Month",
                              style: AppStyle.light1,
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                  child: _currentIndex == 0
                      ? LineChartWidget()
                      : _currentIndex == 1
                          ? LineChartWeekWidget()
                          : LineChartMonthWidget(),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  // height: 50,
                  child: PieChartWithLegend(
                    legendItems: [
                      LegendItem(
                          title: "Wrong",
                          color: AppColors.skin,
                          style: AppStyle.light1),
                      LegendItem(
                          title: "Correct",
                          color: AppColors.darkGreen,
                          style: AppStyle.light1),
                      // legend items
                    ],
                  ),
                ),
                Container(
                  child: Chart(),
                ),
              ],
            ),
          ),
        ));
  }
}
