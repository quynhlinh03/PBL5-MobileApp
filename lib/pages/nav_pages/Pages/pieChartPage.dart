// ignore: file_names
import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_styles.dart';
import '../../../components/advice_box.dart';
import '../../../components/legend_col.dart';
import '../../../values/app_colors.dart';
import '../../../pages/nav_pages/Drawer/navigation_drawer.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:pie_chart/pie_chart.dart';
import 'package:intl/intl.dart';

class PieChartPage extends StatefulWidget {
  const PieChartPage({Key? key}) : super(key: key);

  @override
  _PieChartPageState createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  DateTime dateTime = DateTime(2023, 12, 24);
  Map<String, double> dataMap = {
    "Rounded Shoulders": 20,
    "Forwarded Head": 55,
    "Wrong Leg": 25,
  };
  List<Color> colorList = [
    AppColors.skin,
    AppColors.darkGreen,
    AppColors.mossGreen,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerLeft(),
      // appBar: AppBar(
      //   backgroundColor: AppColors.greenGray,
      //   elevation: 0,
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 100,
            centerTitle: false,
            title: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 0, left: 16, bottom: 16),
              // ignore: sort_child_properties_last
              child: PieChartWithLegend(
                legendItems: [
                  LegendItemCol(
                      title: "Rounded Shoulders",
                      color: AppColors.skin,
                      style: AppStyle.light1white),
                  LegendItemCol(
                      title: "Forwarded Head",
                      color: AppColors.darkGreen,
                      style: AppStyle.light1white),
                  LegendItemCol(
                      title: "Wrong Leg",
                      color: AppColors.mossGreen,
                      style: AppStyle.light1white),
                  // legend items
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 12, bottom: 10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: null,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      )),
                  child: const Center(
                      child: Text("ADVICE", style: AppStyle.regular18))),
            ),
            // floating: true,
            pinned: true,
            backgroundColor: AppColors.greenGray,
            expandedHeight: 480, //420
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: AppColors.greenGray,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 0),
                    Container(
                      padding: EdgeInsets.only(top: 34),
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
                      padding: EdgeInsets.only(top: 20),
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
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(255, 255, 255, 0.3)),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(6)),
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
          SliverToBoxAdapter(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                adviceBox(
                    title: 'Rounded Shoulders',
                    percent:
                        (dataMap["Rounded Shoulders"]!).toStringAsFixed(0) +
                            '%',
                    content:
                        'Độ sâu của ghế phải phù hợp với chiều dài hông. Nếu bạn ngồi trên chiếc ghế lòng sâu, nên để một chiếc gối tựa đằng sau. Nếu không, lưng bạn sẽ bị trượt xuống và dẫn đến căng cơ và đau lưng.',
                    color: AppColors.skin),
                SizedBox(
                  height: 20,
                ),
                adviceBox(
                    title: 'Wrong Leg',
                    percent: (dataMap["Wrong Leg"]!).toStringAsFixed(0) + '%',
                    content:
                        'Không vắt chéo chân, không đi giày cao gót khi ngồi làm việc liên tục vì gây mỏi chân và đau nhức khớp chân. Bạn có thể đặt một dụng cụ để chân khi ngồi làm việc cho cơ thể cảm thấy thoải mái.',
                    color: AppColors.mossGreen),
                SizedBox(
                  height: 20,
                ),
                adviceBox(
                    title: 'Forwarded Head',
                    percent:
                        (dataMap["Forwarded Head"]!).toStringAsFixed(0) + '%',
                    content:
                        'Để tránh đau vai gáy cổ, bạn phải đặt mắt đúng vị trí chuẩn là ngang màn hình. Nếu để mắt thấp hơn, cơ thể sẽ phải trượt xuống ghế , gây ảnh hưởng đến cột sống và lưu thông máu lên não.',
                    color: AppColors.darkGreen),
                SizedBox(
                  height: 45,
                ),
              ],
            ),
          )),
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
