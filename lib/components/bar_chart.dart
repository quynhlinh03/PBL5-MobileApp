import 'package:flutter/material.dart';
import 'package:pbl5_app/components/chart.dart';
import 'package:pbl5_app/components/legend.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../values/app_colors.dart';

class BarChartWidget extends StatefulWidget {
  final String percent;
  final String text;
  final Widget newPage;
  final Widget barPage;

  const BarChartWidget({
    Key? key,
    required this.percent,
    required this.text,
    required this.newPage,
    required this.barPage,
  }) : super(key: key);

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 5,
        ),
        Stack(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.26,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  left: 15,
                  top: 20,
                  bottom: 10,
                ),
                child: widget.barPage,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.center,
          child: PieChartWithLegend(
            legendItems: [
              LegendItem(
                title: "Wrong",
                color: AppColors.skin,
                style: AppStyle.light1,
              ),
              LegendItem(
                title: "Correct",
                color: AppColors.darkGreen,
                style: AppStyle.light1,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Chart(
          percent: widget.percent,
          text: widget.text,
          newPage: widget.newPage,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
