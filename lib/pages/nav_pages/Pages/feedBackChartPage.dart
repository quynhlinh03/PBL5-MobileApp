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

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  @override
  DateTime dateTime = DateTime.now();
  Map<String, Map<String, double>> data = {
    '2023-05-01': {
      "Forwarded Head": 20,
      "Leaning Back": 55,
      "Leaning Forward": 25,
      "Wrong Leg": 10,
    },
    '2023-05-02': {
      "Forwarded Head": 60,
      "Leaning Back": 15,
      "Leaning Forward": 25,
      "Wrong Leg": 10,
    },
    '2023-05-03': {
      "Forwarded Head": 10,
      "Leaning Back": 65,
      "Leaning Forward": 25,
      "Wrong Leg": 10,
    },
    '2023-05-04': {
      "Forwarded Head": 20,
      "Leaning Back": 75,
      "Leaning Forward": 25,
      "Wrong Leg": 10,
    },
    '2023-05-05': {
      "Forwarded Head": 75,
      "Leaning Back": 0,
      "Leaning Forward": 25,
      "Wrong Leg": 10,
    },
    '2023-05-06': {
      "Forwarded Head": 60,
      "Leaning Back": 40,
      "Leaning Forward": 0,
      "Wrong Leg": 10,
    },
  };
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    Map<String, double> dataMap = data[formattedDate] ?? {};
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
                      if (dataMap.isEmpty)
                        Container(
                          padding: const EdgeInsets.only(top: 30),
                          height: 250,
                          child: Center(
                            child: Text(
                              'No Data to Display',
                              style: AppStyle.light1white.copyWith(
                                color: const Color.fromRGBO(0, 0, 0, 0.8),
                              ),
                            ),
                          ),
                        ),
                      if (dataMap.isNotEmpty)
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
                                listData: dataMap.entries.map((entry) {
                                  final currentColor = entry.key ==
                                          dataMap.keys.first
                                      ? AppColors.darkGreen
                                      : (entry.key == dataMap.keys.elementAt(1)
                                          ? AppColors.mossGreen
                                          : (entry.key ==
                                                  dataMap.keys.elementAt(2)
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
                                          '${entry.value..toStringAsFixed(0)} %',
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
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  final date = await pickDate();
                                  if (date == null) return;
                                  setState(() => dateTime = date);
                                },
                                // ignore: sort_child_properties_last
                                child: Text(
                                  '    ${DateFormat('MMMM').format(dateTime)}   ${dateTime.day}   ${dateTime.year}    ',
                                  style: AppStyle.light1white,
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromRGBO(255, 255, 255, 0.3)),
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          // const EdgeInsets.all(7)),
                                          const EdgeInsets.only(
                                              top: 7,
                                              right: 10,
                                              left: 10,
                                              bottom: 7)),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
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
                      if (dataMap.isEmpty)
                        Container(
                          padding: const EdgeInsets.only(top: 90),
                          child: Center(
                            child: Text(
                              'No Data to Display',
                              style: AppStyle.light1white.copyWith(
                                  color: const Color.fromRGBO(0, 0, 0, 1)),
                            ),
                          ),
                        ),
                      if (dataMap.isNotEmpty)
                        if ((dataMap["Forwarded Head"]!) > 0)
                          adviceBox(
                              title: 'Forwarded Head',
                              percent:
                                  '${(dataMap["Forwarded Head"]!).toStringAsFixed(0)}%',
                              content:
                                  'Độ sâu của ghế phải phù hợp với chiều dài hông. Nếu bạn ngồi trên chiếc ghế lòng sâu, nên để một chiếc gối tựa đằng sau. Nếu không, lưng bạn sẽ bị trượt xuống và dẫn đến căng cơ và đau lưng. Độ sâu của ghế phải phù hợp với chiều dài hông. Nếu bạn ngồi trên chiếc ghế lòng sâu, nên để một chiếc gối tựa đằng sau để giúp giữ thẳng lưng.',
                              color: AppColors.darkGreen),
                      if (dataMap.isNotEmpty)
                        if ((dataMap["Forwarded Head"]!) > 0)
                          const SizedBox(
                            height: 24,
                          ),
                      if (dataMap.isNotEmpty)
                        if ((dataMap["Leaning Back"]!) > 0)
                          adviceBox(
                              title: 'Leaning Back',
                              percent:
                                  '${(dataMap["Leaning Back"]!).toStringAsFixed(0)}%',
                              content:
                                  'Để tránh đau vai gáy cổ, bạn phải đặt mắt đúng vị trí chuẩn là ngang màn hình. Nếu để mắt thấp hơn, cơ thể sẽ phải trượt xuống ghế , gây ảnh hưởng đến cột sống và lưu thông máu lên não. Độ sâu của ghế phải phù hợp với chiều dài hông. Nếu bạn ngồi trên chiếc ghế lòng sâu, nên để một chiếc gối tựa đằng sau để giúp giữ thẳng lưng.',
                              color: AppColors.mossGreen),
                      if (dataMap.isNotEmpty)
                        if ((dataMap["Leaning Back"]!) > 0)
                          const SizedBox(
                            height: 38,
                          ),
                      if (dataMap.isNotEmpty)
                        if ((dataMap["Leaning Forward"]!) > 0)
                          adviceBox(
                              title: 'Leaning Forward',
                              percent:
                                  '${(dataMap["Leaning Forward"]!).toStringAsFixed(0)}%',
                              content:
                                  'Không vắt chéo chân, không đi giày cao gót khi ngồi làm việc liên tục vì gây mỏi chân và đau nhức khớp chân. Bạn có thể đặt một dụng cụ để chân khi ngồi làm việc cho cơ thể cảm thấy thoải mái. Độ sâu của ghế phải phù hợp với chiều dài hông. Nếu bạn ngồi trên chiếc ghế lòng sâu, nên để một chiếc gối tựa đằng sau để giúp giữ thẳng lưng.',
                              color: AppColors.darkGray),
                      if (dataMap.isNotEmpty)
                        if ((dataMap["Leaning Forward"]!) > 0)
                          const SizedBox(
                            height: 24,
                          ),
                      if (dataMap.isNotEmpty)
                        if ((dataMap["Wrong Leg"]!) > 0)
                          adviceBox(
                              title: 'Wrong Leg',
                              percent:
                                  '${(dataMap["Wrong Leg"]!).toStringAsFixed(0)}%',
                              content:
                                  'Để tránh đau vai gáy cổ, bạn phải đặt mắt đúng vị trí chuẩn là ngang màn hình. Nếu để mắt thấp hơn, cơ thể sẽ phải trượt xuống ghế , gây ảnh hưởng đến cột sống và lưu thông máu lên não. Độ sâu của ghế phải phù hợp với chiều dài hông. Nếu bạn ngồi trên chiếc ghế lòng sâu, nên để một chiếc gối tựa đằng sau để giúp giữ thẳng lưng.',
                              color: AppColors.flower),
                      if (dataMap.isNotEmpty)
                        if ((dataMap["Wrong Leg"]!) > 0)
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

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));
}
