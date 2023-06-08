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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          padding: const EdgeInsets.only(top: 25),
          color: AppColors.neutral,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
                padding: const EdgeInsets.only(left: 25),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "INSTRUCTIONS FOR PROPER SITTING POSTURE",
                  style: AppStyle.mediumblack16,
                  textAlign: TextAlign.left,
                )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Container(
                    //   padding: const EdgeInsets.only(left: 25, top: 30),
                    //   alignment: Alignment.bottomLeft,
                    //   child: const Text(
                    //     "Tư thế chân",
                    //     style: AppStyle.mediumGreen,
                    //     textAlign: TextAlign.left,
                    //   ),
                    // ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 25, top: 10, right: 20),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Having the correct sitting posture while studying or working with a computer is crucial for maintaining good posture and preventing strain and injuries. Here is a guide on achieving the correct sitting posture when using a computer:",
                        // "Không vắt chéo chân, không đi giày cao gót khi ngồi làm việc liên tục vì gây mỏi chân và đau nhức khớp chân.\nNên điều chỉnh lại ghế ngồi sao cho phần đầu gối với cạnh ghế không vuông góc với nhau. Tốt nhất là nên uốn cong xuống dưới 1 góc quá 90 độ 1 chút.\nBạn có thể đặt một dụng cụ để chân khi ngồi làm việc cho cơ thể cảm thấy thoải mái.\nKhông vắt chéo chân, không đi giày cao gót khi ngồi làm việc liên tục vì gây mỏi chân và đau nhức khớp chân.\nNên điều chỉnh lại ghế ngồi sao cho phần đầu gối với cạnh ghế không vuông góc với nhau. Tốt nhất là nên uốn cong xuống dưới 1 góc quá 90 độ 1 chút.\nBạn có thể đặt một dụng cụ để chân khi ngồi làm việc cho cơ thể cảm thấy thoải mái.",
                        style: AppStyle.light2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, top: 30),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Sit up straight",
                        style: AppStyle.mediumGreen,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 25, top: 10, right: 20),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Ensure that your back is straight, avoiding slouching or hunching forward. Use a backrest or a chair with lumbar support to help maintain proper spinal alignment. This helps keep your spine straight and prevents muscle strain.",
                        // "Độ sâu của ghế phải phù hợp với chiều dài hông của bạn.\nNếu bạn ngồi trên chiếc ghế lòng sâu thì nên để một chiếc gối tựa đằng sau nữa cho vừa.\nNếu không, lưng bạn sẽ bị trượt xuống, điều này dẫn đến căng cơ và đau lưng.\nKhông vắt chéo chân, không đi giày cao gót khi ngồi làm việc liên tục vì gây mỏi chân và đau nhức khớp chân.\nNên điều chỉnh lại ghế ngồi sao cho phần đầu gối với cạnh ghế không vuông góc với nhau. Tốt nhất là nên uốn cong xuống dưới 1 góc quá 90 độ 1 chút.\nBạn có thể đặt một dụng cụ để chân khi ngồi làm việc cho cơ thể cảm thấy thoải mái.",
                        style: AppStyle.light2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, top: 30),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        // "Tư thế cổ",
                        "Place your feet flat",
                        style: AppStyle.mediumGreen,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 25, top: 10, right: 20),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Place your feet flat on the floor or use a footrest if needed. Avoid crossing your legs or tucking your feet under the chair, as this can cause muscle strain and circulatory issues.",
                        // "Để tránh đau vai gáy cổ, tư thế ngồi máy tính chuẩn của bạn phải đặt mắt đúng vị trí chuẩn là ngang màn hình.\nNếu để mắt thấp hơn, cơ thể sẽ phải trượt xuống ghế như hình bên trái, gây ảnh hưởng đến cột sống và lưu thông máu lên não.\nNếu để cao hơn thì lưng uốn cong gây ảnh hưởng đến cột sống.\nKhông vắt chéo chân, không đi giày cao gót khi ngồi làm việc liên tục vì gây mỏi chân và đau nhức khớp chân.\nNên điều chỉnh lại ghế ngồi sao cho phần đầu gối với cạnh ghế không vuông góc với nhau. Tốt nhất là nên uốn cong xuống dưới 1 góc quá 90 độ 1 chút.\nBạn có thể đặt một dụng cụ để chân khi ngồi làm việc cho cơ thể cảm thấy thoải mái.",
                        style: AppStyle.light2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, top: 30),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Position the screen at an appropriate distance",
                        style: AppStyle.mediumGreen,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 25, top: 10, right: 20),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Position the computer screen at a distance of about 20 to 28 inches (50 to 70 cm) from your eyes. Your eyes should be level with the top of the screen when you sit up straight.",
                        style: AppStyle.light2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, top: 30),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Adjust the desk to the proper height",
                        style: AppStyle.mediumGreen,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 25, top: 10, right: 20),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Your desk should be at a height that allows you to rest your forearms and wrists comfortably while typing. Adjust it so that your arms can rest on the desk with your elbows forming a 90-degree angle. This helps prevent wrist and arm strain.",
                        style: AppStyle.light2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, top: 30),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Use an ergonomic chair",
                        style: AppStyle.mediumGreen,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 25, top: 10, right: 20),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Choose an office chair that provides cushioning and proper support for your back and neck. Ensure that the chair is adjustable in height and tilt to allow for customization and comfort.",
                        style: AppStyle.light2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // const SizedBox(
            //   height: 30,
            // ),
          ],
        ),
      ),
    );
  }
}
