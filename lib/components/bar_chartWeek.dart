import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:pbl5_app/values/app_colors.dart';
import 'package:pbl5_app/values/app_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class BarChartWeekComponent extends StatefulWidget {
  const BarChartWeekComponent({Key? key}) : super(key: key);

  @override
  _BarChartWeekComponentState createState() => _BarChartWeekComponentState();
}

class _BarChartWeekComponentState extends State<BarChartWeekComponent> {
  Map<String, double> data = {};
  List<String> keys = [];
  Future<void> getData() async {
    final info = NetworkInfo();
    final String? ipAddress = await info.getWifiIP();
    List<String> parts = ipAddress!.split('.');
    String firstThreeParts = parts.sublist(0, 3).join('.');
    final response = await http.get(
        Uri.parse('http://$firstThreeParts.130:8000/accuracy/1/this_week'));

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

  late TooltipBehavior _tooltipBehavior;
  late SelectionBehavior _selectionBehavior;

  @override
  void initState() {
    super.initState();
    getData();
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
              ('${keys[pointIndex]} : ${point.y.toStringAsFixed(0)}%'),
              style:
                  AppStyle.light1.copyWith(fontSize: 12, color: AppColors.skin),
            ),
          );
        });
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
                    SalesData('Mon', data[keys[0]]!),
                    SalesData('Tue', data[keys[1]]!),
                    SalesData('Wed', data[keys[2]]!),
                    SalesData('Thu', data[keys[3]]!),
                    SalesData('Fri', data[keys[4]]!),
                    SalesData('Sat', data[keys[5]]!),
                    SalesData('Sun', data[keys[6]]!),
                  ],
                  selectionBehavior: _selectionBehavior,
                  xValueMapper: (SalesData sales, _) => sales.day,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  color: AppColors.darkGreen,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  width: 0.3,
                )
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        } else {
          return const SizedBox(
            height: 10,
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
