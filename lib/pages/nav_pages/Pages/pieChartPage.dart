// ignore: file_names
import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../components/advice_box.dart';
import '../../../values/app_colors.dart';
import '../../../pages/nav_pages/Drawer/navigation_drawer.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:pie_chart/pie_chart.dart';

class PieChartPage extends StatefulWidget {
  const PieChartPage({Key? key}) : super(key: key);

  @override
  _PieChartPageState createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  Map<String, double> dataMap = {
    "Rounded Shoulders": 4.0,
    "Forwarded Head": 5.5,
    "Wrong Leg": 2.5,
  };
  List<Color> colorList = [
    AppColors.skin,
    AppColors.darkGreen,
    AppColors.mossGreen,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerLeft(),
      // appBar: AppBar(
      //   backgroundColor: AppColors.greenGray,
      //   elevation: 0,
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // toolbarHeight: 70,
            // title: Row(
            //   mainAxisAlignment: MainAxisAligment.spaceBetween,
            //   children:[
            //     AppIcon(icon: Icons.clear),
            //     AppIcon(icon: Icons.shopping_cart_outlined)
            //   ],
            // ),
            // toolbarHeight: 70,
            // title: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children:[
            //     Container(
            //       child: Text("Linh"),
            //       height: 70,
            //       color: AppColors.greenGray,
            //     )
            //   ],
            // ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 12, bottom: 10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      )),
                  child: const Center(
                      child: Text("ADVICE", style: AppStyle.regular18))),
            ),
            floating: true,
            pinned: true,
            backgroundColor: Colors.white,
            expandedHeight: 420,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  color: AppColors.greenGray,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10.0),
                    PieChart(
                      dataMap: dataMap,
                      colorList: colorList,
                      legendOptions: const LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.right,
                        showLegends: true,
                        // legendShape: _BoxShape.circle,
                        legendTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValues: true,
                        showChartValuesInPercentage: false,
                        showChartValuesOutside: false,
                        decimalPlaces: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: const <Widget>[
              SizedBox(
                height: 15,
              ),
              adviceBox(
                  title: 'Rounded Shoulders',
                  percent: '40%',
                  content:
                      'Không vắt chéo chân, không đi giày cao gót khi ngồi làm việc liên tục vì gây mỏi chân và đau nhức khớp chân. Bạn có thể đặt một dụng cụ để chân khi ngồi làm việc cho cơ thể cảm thấy thoải mái.',
                  color: AppColors.skin),
              SizedBox(
                height: 20,
              ),
              adviceBox(
                  title: 'Wrong Leg',
                  percent: '25%',
                  content:
                      'Không vắt chéo chân, không đi giày cao gót khi ngồi làm việc liên tục vì gây mỏi chân và đau nhức khớp chân. Bạn có thể đặt một dụng cụ để chân khi ngồi làm việc cho cơ thể cảm thấy thoải mái.',
                  color: AppColors.mossGreen),
              SizedBox(
                height: 20,
              ),
              adviceBox(
                  title: 'Forwarded Head',
                  percent: '55%',
                  content:
                      'Không vắt chéo chân, không đi giày cao gót khi ngồi làm việc liên tục vì gây mỏi chân và đau nhức khớp chân. Bạn có thể đặt một dụng cụ để chân khi ngồi làm việc cho cơ thể cảm thấy thoải mái.',
                  color: AppColors.darkGreen),
              SizedBox(
                height: 20,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
