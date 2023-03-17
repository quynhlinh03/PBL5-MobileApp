import 'package:flutter/material.dart';
import '../../../../values/app_styles.dart';
import '../../../../values/app_colors.dart';

class CorrectPosturePage extends StatefulWidget {
  const CorrectPosturePage({Key? key}) : super(key: key);

  @override
  _CorrectPosturePageState createState() => _CorrectPosturePageState();
}

class _CorrectPosturePageState extends State<CorrectPosturePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //get the screen size
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: AppColors.neutral),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
                padding: const EdgeInsets.only(left: 25),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "HƯỚNG DẪN TƯ THẾ NGỒI ĐÚNG",
                  style: AppStyle.mediumblack16,
                  textAlign: TextAlign.left,
                )),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 25, top: 30),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Tư thế chân",
                        style: AppStyle.mediumGreen,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 25, top: 10, right: 20),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Không vắt chéo chân, không đi giày cao gót khi ngồi làm việc liên tục vì gây mỏi chân và đau nhức khớp chân.\nNên điều chỉnh lại ghế ngồi sao cho phần đầu gối với cạnh ghế không vuông góc với nhau. Tốt nhất là nên uốn cong xuống dưới 1 góc quá 90 độ 1 chút.\nBạn có thể đặt một dụng cụ để chân khi ngồi làm việc cho cơ thể cảm thấy thoải mái.",
                        style: AppStyle.light2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, top: 30),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Tư thế lưng",
                        style: AppStyle.mediumGreen,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 25, top: 10, right: 20),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Không vắt chéo chân, không đi giày cao gót khi ngồi làm việc liên tục vì gây mỏi chân và đau nhức khớp chân.\nNên điều chỉnh lại ghế ngồi sao cho phần đầu gối với cạnh ghế không vuông góc với nhau. Tốt nhất là nên uốn cong xuống dưới 1 góc quá 90 độ 1 chút.\nBạn có thể đặt một dụng cụ để chân khi ngồi làm việc cho cơ thể cảm thấy thoải mái.",
                        style: AppStyle.light2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, top: 30),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Tư thế cổ",
                        style: AppStyle.mediumGreen,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 25, top: 10, right: 20),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Không vắt chéo chân, không đi giày cao gót khi ngồi làm việc liên tục vì gây mỏi chân và đau nhức khớp chân.\nNên điều chỉnh lại ghế ngồi sao cho phần đầu gối với cạnh ghế không vuông góc với nhau. Tốt nhất là nên uốn cong xuống dưới 1 góc quá 90 độ 1 chút.\nBạn có thể đặt một dụng cụ để chân khi ngồi làm việc cho cơ thể cảm thấy thoải mái.",
                        style: AppStyle.light2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
