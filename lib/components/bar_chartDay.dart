import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_colors.dart';
import 'package:pbl5_app/values/app_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartDayComponent extends StatefulWidget {
  const BarChartDayComponent({Key? key}) : super(key: key);

  @override
  _BarChartDayComponentState createState() => _BarChartDayComponentState();
}

List<double> hours = [
  20,
  50,
  70,
  80,
  60,
  50,
  40,
  86,
  92,
  51,
  30,
  25,
  60,
  75,
  80,
  90,
  95,
  0,
  25,
  20,
  60,
  0,
  0,
  40
];

class _BarChartDayComponentState extends State<BarChartDayComponent> {
  late TooltipBehavior _tooltipBehavior;
  late SelectionBehavior _selectionBehavior;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
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
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              width: 0.7,
            )
          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.day, this.sales);
  final String day;
  final double sales;
}
