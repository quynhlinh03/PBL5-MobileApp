// ignore: file_names
import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../components/advice_box.dart';
import '../../../components/legend_col.dart';
import '../../../values/app_colors.dart';
import '../../../pages/nav_pages/Drawer/navigation_drawer.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:pie_chart/pie_chart.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class PieChartPage extends StatefulWidget {
  const PieChartPage({Key? key}) : super(key: key);

  @override
  _PieChartPageState createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  DateTime dateTime = DateTime.now();
  Map<String, Map<String, double>> data = {
    '2023-05-01': {
      "Wrong Back": 20,
      "Wrong Head": 55,
      "Wrong Leg": 25,
    },
    '2023-05-02': {
      "Wrong Back": 60,
      "Wrong Head": 15,
      "Wrong Leg": 25,
    },
    '2023-05-03': {
      "Wrong Back": 10,
      "Wrong Head": 65,
      "Wrong Leg": 25,
    },
    '2023-05-04': {
      "Wrong Back": 0,
      "Wrong Head": 75,
      "Wrong Leg": 25,
    },
    '2023-05-05': {
      "Wrong Back": 75,
      "Wrong Head": 0,
      "Wrong Leg": 25,
    },
    '2023-05-06': {
      "Wrong Back": 60,
      "Wrong Head": 40,
      "Wrong Leg": 0,
    },
  };
  List<Color> colorList = [
    AppColors.skin,
    AppColors.darkGreen,
    AppColors.mossGreen,
  ];

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    Map<String, double> dataMap = data[formattedDate] ?? {};
    return Scaffold(
      drawer: NavigationDrawerLeft(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 100,
            centerTitle: false,
            title: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 20, left: 16, bottom: 16),
              child: PieChartWithLegend(
                legendItems: [
                  LegendItemCol(
                      title: "Wrong Back",
                      color: AppColors.skin,
                      style: AppStyle.light1white),
                  LegendItemCol(
                      title: "Wrong Head",
                      color: AppColors.darkGreen,
                      style: AppStyle.light1white),
                  LegendItemCol(
                      title: "Wrong Leg",
                      color: AppColors.mossGreen,
                      style: AppStyle.light1white),
                ],
              ),
            ),
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
            expandedHeight: 500, //420
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
                      const SizedBox(height: 10),
                      if (dataMap.isEmpty)
                        Container(
                          padding: const EdgeInsets.only(top: 30),
                          height: 285,
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
                          padding: const EdgeInsets.only(top: 30),
                          width: 260,
                          child: PieChart(
                            dataMap: dataMap,
                            colorList: colorList,
                            chartType: ChartType.disc,
                            legendOptions: const LegendOptions(
                              showLegends: false,
                            ),
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValueBackground: false,
                              showChartValues: true,
                              showChartValuesInPercentage: true,
                              showChartValuesOutside: false,
                              decimalPlaces: 1,
                              chartValueStyle: AppStyle.light1,
                            ),
                          ),
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
                        if ((dataMap["Wrong Back"]!) > 0)
                          adviceBox(
                              title: 'Wrong Back',
                              percent:
                                  '${(dataMap["Wrong Back"]!).toStringAsFixed(0)}%',
                              content:
                                  'Độ sâu của ghế phải phù hợp với chiều dài hông. Nếu bạn ngồi trên chiếc ghế lòng sâu, nên để một chiếc gối tựa đằng sau. Nếu không, lưng bạn sẽ bị trượt xuống và dẫn đến căng cơ và đau lưng. Độ sâu của ghế phải phù hợp với chiều dài hông. Nếu bạn ngồi trên chiếc ghế lòng sâu, nên để một chiếc gối tựa đằng sau để giúp giữ thẳng lưng.',
                              color: AppColors.skin),
                      if (dataMap.isNotEmpty)
                        if ((dataMap["Wrong Back"]!) > 0)
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
                                  'Không vắt chéo chân, không đi giày cao gót khi ngồi làm việc liên tục vì gây mỏi chân và đau nhức khớp chân. Bạn có thể đặt một dụng cụ để chân khi ngồi làm việc cho cơ thể cảm thấy thoải mái. Độ sâu của ghế phải phù hợp với chiều dài hông. Nếu bạn ngồi trên chiếc ghế lòng sâu, nên để một chiếc gối tựa đằng sau để giúp giữ thẳng lưng.',
                              color: AppColors.mossGreen),
                      if (dataMap.isNotEmpty)
                        if ((dataMap["Wrong Leg"]!) > 0)
                          const SizedBox(
                            height: 24,
                          ),
                      if (dataMap.isNotEmpty)
                        if ((dataMap["Wrong Head"]!) > 0)
                          adviceBox(
                              title: 'Wrong Head',
                              percent:
                                  '${(dataMap["Wrong Head"]!).toStringAsFixed(0)}%',
                              content:
                                  'Để tránh đau vai gáy cổ, bạn phải đặt mắt đúng vị trí chuẩn là ngang màn hình. Nếu để mắt thấp hơn, cơ thể sẽ phải trượt xuống ghế , gây ảnh hưởng đến cột sống và lưu thông máu lên não. Độ sâu của ghế phải phù hợp với chiều dài hông. Nếu bạn ngồi trên chiếc ghế lòng sâu, nên để một chiếc gối tựa đằng sau để giúp giữ thẳng lưng.',
                              color: AppColors.darkGreen),
                      if (dataMap.isNotEmpty)
                        if ((dataMap["Wrong Head"]!) > 0)
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
