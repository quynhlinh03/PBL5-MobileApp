import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_styles.dart';

import '../values/app_colors.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Stack(
        children: [
          AnimatedSizeAndFade(
            fadeDuration: const Duration(milliseconds: 500),
            child: PieChart(
              PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: 91,
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
                  "25",
                  style: AppStyle.semibold
                      .copyWith(fontSize: 44, color: AppColors.darkGreen),
                ),
                Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "%\nThis day",
                      style: AppStyle.light2,
                      textAlign: TextAlign.center,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> paiChartSelectionDatas = [
  PieChartSectionData(
    color: AppColors.skin,
    value: 75,
    showTitle: false,
    radius: 16,
  ),
  PieChartSectionData(
    color: AppColors.darkGreen,
    value: 25,
    showTitle: false,
    radius: 16,
  ),
];
