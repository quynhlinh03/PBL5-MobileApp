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

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationDrawerLeft(),
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
                const SizedBox(height: 15),
                const Text(
                  "Posture Analysis ",
                  style: AppStyle.regular2,
                ),
                AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    padding: const EdgeInsets.only(top: 30, bottom: 3),
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
                      ? const LineChartWidget()
                      : _currentIndex == 1
                          ? const LineChartWeekWidget()
                          : const LineChartMonthWidget(),
                ),
                const SizedBox(height: 10),
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
                const SizedBox(
                  height: 10,
                ),
                const Chart(),
              ],
            ),
          ),
        ));
  }
}
