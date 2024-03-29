import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../components/advice_box.dart';
import '../../../components/legend_col.dart';
import '../../../values/app_colors.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:pie_chart/pie_chart.dart';
// ignore: depend_on_referenced_packages

class FeedBackWeekPage extends StatefulWidget {
  final Map<String, double> dataMap;
  final String text;

  const FeedBackWeekPage({Key? key, required this.dataMap, required this.text})
      : super(key: key);

  @override
  _FeedBackWeekPageState createState() => _FeedBackWeekPageState();
}

class _FeedBackWeekPageState extends State<FeedBackWeekPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 18, bottom: 12),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: null,
                      border: null,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      )),
                  child: const Center(
                      child: Text("ADVICE", style: AppStyle.regular18))),
            ),
            pinned: true,
            backgroundColor: AppColors.greenGray,
            expandedHeight: 530, //420
            flexibleSpace: FlexibleSpaceBar(
              background: AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                child: Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: AppColors.greenGray,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.only(right: 16),
                        child: PieChartWithLegend(
                          legendItems: [
                            LegendItemCol(
                                title: "Forwarded Head",
                                color: AppColors.darkGreen,
                                style: AppStyle.light1white),
                            LegendItemCol(
                                title: "Leaning Back",
                                color: AppColors.mossGreen,
                                style: AppStyle.light1white),
                            LegendItemCol(
                                title: "Leaning Forward",
                                color: AppColors.darkGray,
                                style: AppStyle.light1white),
                            LegendItemCol(
                                title: "Wrong Leg",
                                color: AppColors.flower,
                                style: AppStyle.light1white),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 30, right: 10, left: 10, bottom: 20),
                        width: 370,
                        child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: DChartBarCustom(
                              loadingDuration:
                                  const Duration(milliseconds: 1500),
                              showLoading: true,
                              valueAlign: Alignment.topCenter,
                              showDomainLine: false,
                              showDomainLabel: false,
                              showMeasureLine: false,
                              showMeasureLabel: false,
                              spaceDomainLabeltoChart: 0,
                              spaceMeasureLabeltoChart: 0,
                              spaceDomainLinetoChart: 0,
                              spaceMeasureLinetoChart: 0,
                              spaceBetweenItem: 20,
                              radiusBar: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              measureLabelStyle: AppStyle.light1,
                              measureLineStyle: const BorderSide(
                                  color: Colors.white, width: 1),
                              domainLineStyle: const BorderSide(
                                  color: Colors.white, width: 1),
                              max: 100,
                              // Use forEach instead of map since you're not returning anything
                              listData: widget.dataMap.entries.map((entry) {
                                final currentColor = entry.key ==
                                        widget.dataMap.keys.first
                                    ? AppColors.darkGreen
                                    : (entry.key ==
                                            widget.dataMap.keys.elementAt(1)
                                        ? AppColors.mossGreen
                                        : (entry.key ==
                                                widget.dataMap.keys.elementAt(2)
                                            ? AppColors.darkGray
                                            : AppColors.flower));
                                return DChartBarDataCustom(
                                  onTap: () {
                                    print('${entry.key} => ${entry.value}');
                                  },
                                  elevation: 8,
                                  value: entry.value,
                                  label: entry.key,
                                  color: currentColor.withOpacity(1),
                                  splashColor: Colors.blue,
                                  showValue: true,
                                  valueStyle: AppStyle.light1,
                                  valueCustom: Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        '${entry.value.toStringAsFixed(0)} %',
                                        style: AppStyle.light1white.copyWith(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  valueTooltip: entry.key,
                                );
                              }).toList(), // Convert Iterable to List
                            )),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 18),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromRGBO(255, 255, 255, 0.3),
                          ),
                          padding: const EdgeInsets.only(
                              top: 7, right: 10, left: 10, bottom: 7),
                          child: Text(widget.text, style: AppStyle.light1white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 21,
                      ),
                      if ((widget.dataMap["forwarded_head"]!) > 0)
                        adviceBox(
                            title: 'Forwarded Head',
                            percent:
                                '${(widget.dataMap["forwarded_head"]!).toStringAsFixed(0)}%',
                            content:
                                'To avoid having your head bent too low, you should position your computer screen at an appropriate height, keeping your head straight and level with the screen. Keep your eyes at the same level as the top of the computer screen. Use a chair with the appropriate height. You can also use a cushion under your buttocks if needed.',
                            color: AppColors.darkGreen),
                      if ((widget.dataMap["forwarded_head"]!) > 0)
                        const SizedBox(
                          height: 24,
                        ),
                      if ((widget.dataMap["leaning_back"]!) > 0)
                        adviceBox(
                            title: 'Leaning Back',
                            percent:
                                '${(widget.dataMap["leaning_back"]!).toStringAsFixed(0)}%',
                            content:
                                'Place feet flat on the ground, buttocks comfortably on the seat, and back straight. Ensure that the height and depth of the chair are appropriate to keep your back straight while sitting. The depth of the chair should be in line with the length of your hips. If you are sitting on a deep seat, you should place a cushion behind your back.',
                            color: AppColors.mossGreen),
                      if ((widget.dataMap["leaning_back"]!) > 0)
                        const SizedBox(
                          height: 38,
                        ),
                      if ((widget.dataMap["leaning_forward"]!) > 0)
                        adviceBox(
                            title: 'Leaning Forward',
                            percent:
                                '${(widget.dataMap["leaning_forward"]!).toStringAsFixed(0)}%',
                            content:
                                'Place feet flat on the ground, buttocks comfortably on the seat, and back straight. Ensure that the height and depth of the chair are appropriate to keep your back straight while sitting. The depth of the chair should be in line with the length of your hips. If you are sitting on a deep seat, you should place a cushion behind your back.',
                            color: AppColors.darkGray),
                      if ((widget.dataMap["leaning_forward"]!) > 0)
                        const SizedBox(
                          height: 24,
                        ),
                      if ((widget.dataMap["wrong_leg"]!) > 0)
                        adviceBox(
                            title: 'Wrong Leg',
                            percent:
                                '${(widget.dataMap["wrong_leg"]!).toStringAsFixed(0)}%',
                            content:
                                'Place both feet evenly and straight on the ground, with the knees pointing straight ahead and at a 90-degree angle. Keep your feet shoulder-width apart and straight and parallel to each other. Choose a chair with the appropriate height. If your chair is too low, you can place a footrest under your feet to raise them.',
                            color: AppColors.flower),
                      if ((widget.dataMap["wrong_leg"]!) > 0)
                        const SizedBox(
                          height: 38,
                        ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
