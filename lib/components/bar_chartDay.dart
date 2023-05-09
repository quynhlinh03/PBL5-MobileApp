import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_colors.dart';
import 'package:pbl5_app/values/app_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class BarChartDayComponent extends StatefulWidget {
  const BarChartDayComponent({Key? key}) : super(key: key);

  @override
  _BarChartDayComponentState createState() => _BarChartDayComponentState();
}

List<dynamic> hours = [];

class _BarChartDayComponentState extends State<BarChartDayComponent> {
  late TooltipBehavior _tooltipBehavior;
  late SelectionBehavior _selectionBehavior;
  Future<void> getData() async {
    final responseAverageDay = await http
        .get(Uri.parse('http://192.168.90.130:8000/accuracy/1/day/2023-05-02'));
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
                          SalesData('1', hours[0]),
                          SalesData('2', hours[1]),
                          SalesData('3', hours[2]),
                          SalesData('4', hours[3]),
                          SalesData('5', hours[4]),
                          SalesData('6', hours[5]),
                          SalesData('7', hours[6]),
                          SalesData('8', hours[7]),
                          SalesData('9', hours[8]),
                          SalesData('10', hours[9]),
                          SalesData('11', hours[10]),
                          SalesData('12', hours[11]),
                          SalesData('13', hours[12]),
                          SalesData('14', hours[13]),
                          SalesData('15', hours[14]),
                          SalesData('16', hours[15]),
                          SalesData('17', hours[16]),
                          SalesData('18', hours[17]),
                          SalesData('19', hours[18]),
                          SalesData('20', hours[19]),
                          SalesData('21', hours[20]),
                          SalesData('22', hours[21]),
                          SalesData('23', hours[22]),
                          SalesData('24', hours[23]),
                        ],
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
