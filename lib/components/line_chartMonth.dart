import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_styles.dart';

import '../values/app_colors.dart';

class LineChartMonthWidget extends StatefulWidget {
  const LineChartMonthWidget({super.key});

  @override
  State<LineChartMonthWidget> createState() => _LineChartMonthWidgetState();
}

class _LineChartMonthWidgetState extends State<LineChartMonthWidget> {
  List<Color> gradientColors = [
    AppColors.skin,
    AppColors.darkGreen,
  ];

  // final List<FlSpot> _monthlySpots = [
  //   const FlSpot(1, 5),
  //   const FlSpot(2, 4),
  //   const FlSpot(3, 3),
  //   const FlSpot(4, 2.1),
  //   const FlSpot(5, 2),
  //   const FlSpot(6, 5),
  //   const FlSpot(7, 4),
  //   const FlSpot(8, 3),
  //   const FlSpot(9, 2.1),
  //   const FlSpot(10, 2),
  //   const FlSpot(11, 2.1),
  //   const FlSpot(12, 2),
  // ];

  // final List<FlSpot> _monthlySpots2 = [
  //   const FlSpot(1, 2),
  //   const FlSpot(2, 3),
  //   const FlSpot(3, 4),
  //   const FlSpot(4, 4.9),
  //   const FlSpot(5, 5),
  //   const FlSpot(6, 2),
  //   const FlSpot(7, 3),
  //   const FlSpot(8, 4),
  //   const FlSpot(9, 4.9),
  //   const FlSpot(10, 5),
  //   const FlSpot(11, 4.9),
  //   const FlSpot(12, 5),
  // ];

  final List<FlSpot> _monthlySpots = [];
  final List<FlSpot> _monthlySpots2 = [];
  var monthlySpot = [
    0.6,
    0.8,
    0.7,
    0.7,
    0.5,
    null,
    0.1,
    0.5,
    null,
    0.7,
    0.1,
    null
  ];

  @override
  Widget build(BuildContext context) {
    var x = 0;
    for (var i = 1.0; i <= 12; i += 1) {
      if (monthlySpot[x.toInt()] != null) {
        _monthlySpots
            .add(FlSpot(i, (5 * (monthlySpot[x.toInt()]!) + 1).toDouble()));
        _monthlySpots2.add(
            FlSpot(i, (7 - (5 * (monthlySpot[x.toInt()]!) + 1)).toDouble()));
      }
      x += 1;
    }

    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.4,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
              top: 0,
              bottom: 14,
            ),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = AppStyle.light1;
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('1', style: style);
        break;
      case 2:
        text = const Text('2', style: style);
        break;
      case 3:
        text = const Text('3', style: style);
        break;
      case 4:
        text = const Text('4', style: style);
        break;
      case 5:
        text = const Text('5', style: style);
        break;
      case 6:
        text = const Text('6', style: style);
        break;
      case 7:
        text = const Text('7', style: style);
        break;
      case 8:
        text = const Text('8', style: style);
        break;
      case 9:
        text = const Text('9', style: style);
        break;
      case 10:
        text = const Text('10', style: style);
        break;
      case 11:
        text = const Text('11', style: style);
        break;
      case 12:
        text = const Text('12', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = AppStyle.light1;
    String text;
    switch (value.toInt()) {
      case 1:
        text = '0%';
        break;
      case 2:
        text = '20%';
        break;
      case 3:
        text = '40%';
        break;
      case 4:
        text = '60%';
        break;
      case 5:
        text = '80%';
        break;
      case 6:
        text = '100%';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: AppColors.blackBlur,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: AppColors.blackBlur,
            strokeWidth: 0,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42, //không gian hiển thị tiêu đề
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 13,
      minY: 0,
      maxY: 7,
      lineBarsData: [
        LineChartBarData(
          //line1
          spots: _monthlySpots,
          isCurved: false,
          color: AppColors.skin,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) =>
                FlDotCirclePainter(
              strokeWidth: 0,
              color: AppColors.skin,
            ),
          ),
          belowBarData: BarAreaData(
            show: false,
          ),
        ),
        LineChartBarData(
          //line2
          spots: _monthlySpots2,
          isCurved: false,
          color: AppColors.darkGreen,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) =>
                FlDotCirclePainter(
              strokeWidth: 0,
              color: AppColors.darkGreen,
            ),
          ),
        ),
      ],
    );
  }
}
