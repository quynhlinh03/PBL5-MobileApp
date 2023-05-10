import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:pbl5_app/values/app_colors.dart';
import 'package:pbl5_app/values/app_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class BarChartMonthComponent extends StatefulWidget {
  const BarChartMonthComponent({Key? key}) : super(key: key);

  @override
  _BarChartMonthComponentState createState() => _BarChartMonthComponentState();
}

class _BarChartMonthComponentState extends State<BarChartMonthComponent> {
  late TooltipBehavior _tooltipBehavior;
  late SelectionBehavior _selectionBehavior;
  Map<String, double> data = {};
  List<String> keys = [];
  Future<void> getData() async {
    final info = NetworkInfo();
    final String? ipAddress = await info.getWifiIP();
    List<String> parts = ipAddress!.split('.');
    String firstThreeParts = parts.sublist(0, 3).join('.');
    final response = await http.get(
        Uri.parse('http://$firstThreeParts.130:8000/accuracy/1/this_month'));

    if (response.statusCode == 200) {
      final newData = jsonDecode(response.body);
      Map<String, dynamic> items = newData["items"];
      items.forEach((key, value) {
        if (value is num) {
          data[key] = value.toDouble();
        } else {
          data[key] = 0;
        }
      });
      keys = data.keys.toList();
    } else {
      // xử lý lỗi nếu cần
    }
  }

  @override
  void initState() {
    _selectionBehavior = SelectionBehavior(
        enable: true,
        selectedColor: AppColors.darkGreen,
        unselectedColor: AppColors.darkGreen,
        selectedOpacity: 0.9,
        unselectedOpacity: 1);
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        opacity: 0.8,
        activationMode: ActivationMode.singleTap,
        // Templating the tooltip
        builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
            int seriesIndex) {
          return Container(
            alignment: Alignment.center,
            transformAlignment: Alignment.center,
            width: 100,
            height: 30,
            color: AppColors.gray, // thiết lập màu nền cho Container
            child: Text(
              ('${keys[pointIndex]} : ${point.y.toInt()}%'),
              style:
                  AppStyle.light1.copyWith(fontSize: 12, color: AppColors.skin),
            ),
          );
        });
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<void>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            child: SfCartesianChart(
              zoomPanBehavior: ZoomPanBehavior(
                enablePanning: true,
                enablePinching: true,
                zoomMode: ZoomMode.x,
              ),
              tooltipBehavior: _tooltipBehavior,
              isTransposed: true,
              primaryXAxis: CategoryAxis(
                labelStyle: AppStyle.light1.copyWith(fontSize: 10.5),
                majorTickLines: const MajorTickLines(
                  width: 1, // độ dày của đường gạch kẻ dọc lớn
                ),
                minorTickLines: const MinorTickLines(
                  width: 1, // độ dày của đường gạch kẻ dọc nhỏ
                ),
                majorGridLines: const MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                  labelFormat: "{value}%",
                  labelStyle: AppStyle.light1.copyWith(fontSize: 10.5),
                  majorTickLines: const MajorTickLines(
                    width: 1, // độ dày của đường gạch kẻ dọc lớn
                  ),
                  minorTickLines: const MinorTickLines(
                    width: 1, // độ dày của đường gạch kẻ dọc nhỏ
                  ),
                  majorGridLines: const MajorGridLines(
                    width: 1, // độ dày đường lưới chính
                  ),
                  maximum: 100),
              borderWidth: 1, // độ dày của đường bao quanh đồ thị
              series: <ChartSeries>[
                BarSeries<SalesData, String>(
                  dataSource: <SalesData>[
                    SalesData('1', data[keys[0]]!),
                    SalesData('2', data[keys[1]]!),
                    SalesData('3', data[keys[2]]!),
                    SalesData('4', data[keys[3]]!),
                    SalesData('5', data[keys[4]]!),
                    SalesData('6', data[keys[5]]!),
                    SalesData('7', data[keys[6]]!),
                    SalesData('8', data[keys[7]]!),
                    SalesData('9', data[keys[8]]!),
                    SalesData('10', data[keys[9]]!),
                    SalesData('11', data[keys[10]]!),
                    SalesData('12', data[keys[11]]!),
                    SalesData('13', data[keys[12]]!),
                    SalesData('14', data[keys[13]]!),
                    SalesData('15', data[keys[14]]!),
                    SalesData('16', data[keys[15]]!),
                    SalesData('17', data[keys[16]]!),
                    SalesData('18', data[keys[17]]!),
                    SalesData('19', data[keys[18]]!),
                    SalesData('20', data[keys[19]]!),
                    SalesData('21', data[keys[20]]!),
                    SalesData('22', data[keys[21]]!),
                    SalesData('23', data[keys[22]]!),
                    SalesData('24', data[keys[23]]!),
                    SalesData('25', data[keys[24]]!),
                    SalesData('26', data[keys[25]]!),
                    SalesData('27', data[keys[26]]!),
                    SalesData('28', data[keys[27]]!),
                    SalesData('29', data[keys[28]]!),
                    SalesData('30', data[keys[29]]!),
                    SalesData('31', data[keys[30]]!),
                  ],
                  selectionBehavior: _selectionBehavior,
                  xValueMapper: (SalesData sales, _) => sales.day,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  color: AppColors.darkGreen,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  width: 0.85,
                )
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        } else {
          return SizedBox(
            child: SfCartesianChart(
                // chart code goes here
                ),
          );
        }
      },
    ));
  }
}

class SalesData {
  SalesData(this.day, this.sales);
  final String day;
  final double sales;
}
