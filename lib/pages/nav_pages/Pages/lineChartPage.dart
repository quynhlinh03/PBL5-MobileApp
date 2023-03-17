import 'package:flutter/material.dart';
import 'package:pbl5_app/components/chart.dart';
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
              // mainAxisAlignment: MainAxisAlignment.center, // canh giữa theo chiều dọc
              children: [
                Container(
                    child: Text(
                  "Posture Analysis ",
                  style: AppStyle.regular.copyWith(fontSize: 20),
                )),
                SizedBox(height: 15),
                Container(
                  child: LineChartWidget(),
                ),
                SizedBox(height: 20),
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
