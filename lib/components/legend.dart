import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_styles.dart';

class LegendItem {
  final String title;
  final style;
  final Color color;

  LegendItem({required this.title, required this.color, required this.style});
}

class PieChartWithLegend extends StatelessWidget {
  final List<LegendItem> legendItems;

  PieChartWithLegend({required this.legendItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final item in legendItems)
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 12,
                      color: item.color,
                    ),
                    SizedBox(width: 10),
                    Text(
                      item.title,
                      style: item.style,
                      // style: AppStyle.light1,
                    ),
                    if (item != legendItems.last)
                      SizedBox(
                        width: 50,
                      ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
