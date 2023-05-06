import 'package:flutter/material.dart';

class LegendItemCol {
  final String title;
  final style;
  final Color color;

  LegendItemCol(
      {required this.title, required this.color, required this.style});
}

class PieChartWithLegend extends StatelessWidget {
  final List<LegendItemCol> legendItems;

  const PieChartWithLegend({super.key, required this.legendItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0),
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (final item in legendItems)
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        item.title,
                        style: item.style,
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.circle,
                        size: 16,
                        color: item.color,
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
        const SizedBox(width: 5), // khoảng cách muốn căn lề phải
      ],
    );
  }
}
