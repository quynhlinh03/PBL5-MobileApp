import 'dart:convert';

import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../components/advice_box.dart';
import '../../../components/legend_col.dart';
import '../../../values/app_colors.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:pie_chart/pie_chart.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  DateTime dateTime = DateTime.now();
  Map<String, double> dataDay = {};

  Future<void> getData(DateTime date) async {
    final info = NetworkInfo();
    final String? ipAddress = await info.getWifiIP();
    List<String> parts = ipAddress!.split('.');
    String firstThreeParts = parts.sublist(0, 3).join('.');
    final formattedDate = DateFormat('yyyy-MM-dd').format(date);
    final responseDay = await http.get(Uri.parse(
        'http://$firstThreeParts.130:8000/incorrect_percentage/1/day/$formattedDate'));

    if (responseDay.statusCode == 200) {
      final newDataDay = jsonDecode(responseDay.body);
      dataDay = {};
      newDataDay.forEach((key, value) {
        if (value is num) {
          dataDay[key] = value.toDouble();
        }
      });
      // sử dụng dữ liệu ở đây
    } else {
      // xử lý lỗi nếu cần
    }
  }

  @override
  void initState() {
    super.initState();
    getData(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return Scaffold(
        body: FutureBuilder<void>(
            future: getData(dateTime),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CustomScrollView(
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
                                child:
                                    Text("ADVICE", style: AppStyle.regular18))),
                      ),
                      pinned: true,
                      backgroundColor: AppColors.greenGray,
                      expandedHeight: 530, //420
                      flexibleSpace: FlexibleSpaceBar(
                        background: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 1000),
                          child: Container(
                            key: ValueKey(formattedDate),
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
                                if (dataDay.isEmpty)
                                  Container(
                                    padding: const EdgeInsets.only(top: 30),
                                    height: 250,
                                    child: Center(
                                      child: Text(
                                        'No Data to Display',
                                        style: AppStyle.light1white.copyWith(
                                          color: const Color.fromRGBO(
                                              0, 0, 0, 0.8),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (dataDay.isNotEmpty)
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 30,
                                        right: 10,
                                        left: 10,
                                        bottom: 20),
                                    width: 370,
                                    child: AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: DChartBarCustom(
                                          loadingDuration: const Duration(
                                              milliseconds: 1500),
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
                                          listData:
                                              dataDay.entries.map((entry) {
                                            final currentColor = entry.key ==
                                                    dataDay.keys.first
                                                ? AppColors.darkGreen
                                                : (entry.key ==
                                                        dataDay.keys
                                                            .elementAt(1)
                                                    ? AppColors.mossGreen
                                                    : (entry.key ==
                                                            dataDay.keys
                                                                .elementAt(2)
                                                        ? AppColors.darkGray
                                                        : AppColors.flower));
                                            return DChartBarDataCustom(
                                              onTap: () {
                                                print(
                                                    '${entry.key} => ${entry.value}');
                                              },
                                              elevation: 8,
                                              value: entry.value,
                                              label: entry.key,
                                              color:
                                                  currentColor.withOpacity(1),
                                              splashColor: Colors.blue,
                                              showValue: true,
                                              valueStyle: AppStyle.light1,
                                              valueCustom: Align(
                                                alignment: Alignment.topCenter,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Text(
                                                    '${entry.value.toStringAsFixed(0)} %',
                                                    style: AppStyle.light1white
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
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
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () async {
                                            final date = await pickDate();
                                            if (date == null) return;
                                            setState(() {
                                              dateTime = date;
                                              getData(dateTime);
                                            });
                                          },
                                          // ignore: sort_child_properties_last
                                          child: Text(
                                            '    ${DateFormat('MMMM').format(dateTime)}   ${dateTime.day}   ${dateTime.year}    ',
                                            style: AppStyle.light1white,
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                        Color>(
                                                    const Color.fromRGBO(
                                                        255, 255, 255, 0.3)),
                                            padding: MaterialStateProperty.all<
                                                    EdgeInsets>(
                                                // const EdgeInsets.all(7)),
                                                const EdgeInsets.only(
                                                    top: 7,
                                                    right: 10,
                                                    left: 10,
                                                    bottom: 7)),
                                            shape: MaterialStateProperty.all<
                                                OutlinedBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                          ),
                                        )
                                      ]),
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
                            key: ValueKey(formattedDate),
                            child: Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 21,
                                ),
                                if (dataDay.isEmpty)
                                  Container(
                                    padding: const EdgeInsets.only(top: 90),
                                    child: Center(
                                      child: Text(
                                        'No Data to Display',
                                        style: AppStyle.light1white.copyWith(
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 1)),
                                      ),
                                    ),
                                  ),
                                if (dataDay.isNotEmpty)
                                  if ((dataDay["forwarded_head"]!) > 0)
                                    adviceBox(
                                        title: 'Forwarded Head',
                                        percent:
                                            '${(dataDay["forwarded_head"]!).toStringAsFixed(0)}%',
                                        content:
                                            'To avoid having your head bent too low, you should position your computer screen at an appropriate height, keeping your head straight and level with the screen. Keep your eyes at the same level as the top of the computer screen. Use a chair with the appropriate height. You can also use a cushion under your buttocks if needed.',
                                        color: AppColors.darkGreen),
                                if (dataDay.isNotEmpty)
                                  if ((dataDay["forwarded_head"]!) > 0)
                                    const SizedBox(
                                      height: 24,
                                    ),
                                if (dataDay.isNotEmpty)
                                  if ((dataDay["leaning_back"]!) > 0)
                                    adviceBox(
                                        title: 'Leaning Back',
                                        percent:
                                            '${(dataDay["leaning_back"]!).toStringAsFixed(0)}%',
                                        content:
                                            'Place feet flat on the ground, buttocks comfortably on the seat, and back straight. Ensure that the height and depth of the chair are appropriate to keep your back straight while sitting. The depth of the chair should be in line with the length of your hips. If you are sitting on a deep seat, you should place a cushion behind your back.',
                                        color: AppColors.mossGreen),
                                if (dataDay.isNotEmpty)
                                  if ((dataDay["leaning_back"]!) > 0)
                                    const SizedBox(
                                      height: 38,
                                    ),
                                if (dataDay.isNotEmpty)
                                  if ((dataDay["leaning_forward"]!) > 0)
                                    adviceBox(
                                        title: 'Leaning Forward',
                                        percent:
                                            '${(dataDay["leaning_forward"]!).toStringAsFixed(0)}%',
                                        content:
                                            'Place feet flat on the ground, buttocks comfortably on the seat, and back straight. Ensure that the height and depth of the chair are appropriate to keep your back straight while sitting. The depth of the chair should be in line with the length of your hips. If you are sitting on a deep seat, you should place a cushion behind your back.',
                                        color: AppColors.darkGray),
                                if (dataDay.isNotEmpty)
                                  if ((dataDay["leaning_forward"]!) > 0)
                                    const SizedBox(
                                      height: 24,
                                    ),
                                if (dataDay.isNotEmpty)
                                  if ((dataDay["wrong_leg"]!) > 0)
                                    adviceBox(
                                        title: 'Wrong Leg',
                                        percent:
                                            '${(dataDay["wrong_leg"]!).toStringAsFixed(0)}%',
                                        content:
                                            'Place both feet evenly and straight on the ground, with the knees pointing straight ahead and at a 90-degree angle. Keep your feet shoulder-width apart and straight and parallel to each other. Choose a chair with the appropriate height. If your chair is too low, you can place a footrest under your feet to raise them.',
                                        color: AppColors.flower),
                                if (dataDay.isNotEmpty)
                                  if ((dataDay["wrong_leg"]!) > 0)
                                    const SizedBox(
                                      height: 38,
                                    ),
                              ],
                            ),
                          )),
                    ),
                  ],
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

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));
}
