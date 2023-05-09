import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_styles.dart';

import '../values/app_colors.dart';

class Chart extends StatelessWidget {
  final String percent;
  final String text;
  final Widget newPage;
  const Chart({
    super.key,
    required this.percent,
    required this.text,
    required this.newPage,
  });

  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> paiChartSelectionDatas = [
      PieChartSectionData(
        color: AppColors.darkGreen,
        value: double.tryParse(percent),
        showTitle: false,
        radius: 16,
      ),
      PieChartSectionData(
        color: AppColors.skin,
        value: 100 - double.parse(percent),
        showTitle: false,
        radius: 16,
      ),
    ];
    return SizedBox(
      height: 240,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => newPage,
              settings: RouteSettings(
                arguments: percent,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            AnimatedSizeAndFade(
              fadeDuration: const Duration(milliseconds: 500),
              child: PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 86,
                  startDegreeOffset: -280,
                  sections: paiChartSelectionDatas,
                ),
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    percent,
                    style: AppStyle.semibold
                        .copyWith(fontSize: 40, color: AppColors.darkGreen),
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        "%\nThis $text",
                        style: AppStyle.light2,
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
