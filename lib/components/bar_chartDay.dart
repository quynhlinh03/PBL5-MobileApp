import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_colors.dart';
import 'package:pbl5_app/values/app_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:network_info_plus/network_info_plus.dart';

class BarChartDayComponent extends StatefulWidget {
  const BarChartDayComponent({Key? key}) : super(key: key);

  @override
  _BarChartDayComponentState createState() => _BarChartDayComponentState();
}

List<dynamic> hours = [];

class _BarChartDayComponentState extends State<BarChartDayComponent> {
  late TooltipBehavior _tooltipBehavior;
  late SelectionBehavior _selectionBehavior;
  final formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<void> getData() async {
    final info = NetworkInfo();
    final String? ipAddress = await info.getWifiIP();
    List<String> parts = ipAddress!.split('.');
    String firstThreeParts = parts.sublist(0, 3).join('.');
    final responseAverageDay = await http.get(Uri.parse(
        'http://$firstThreeParts.130:8000/accuracy/1/day/$formattedDate'));
    if (responseAverageDay.statusCode == 200) {
      final averDay = jsonDecode(responseAverageDay.body);
      hours = averDay["items"];
      hours = hours.map((number) => number ?? 0.0).toList();
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
              '$pointIndex:00 - ${pointIndex + 1}:00 : ${point.y.toInt()}%',
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
                List<SalesData> salesDataList = [];
                for (int i = 0; i < hours.length; i++) {
                  salesDataList.add(SalesData('${i + 1}', hours[i]));
                }
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
                        dataSource: salesDataList,
                        selectionBehavior: _selectionBehavior,
                        xValueMapper: (SalesData sales, _) => sales.day,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        color: AppColors.darkGreen,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        width: 0.7,
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
            }));
  }
}

class SalesData {
  SalesData(this.day, this.sales);
  final String day;
  final double sales;
}
