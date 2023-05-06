import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_styles.dart';
import 'package:pbl5_app/values/app_colors.dart';

class CustomNotification extends StatelessWidget {
  CustomNotification({
    Key? key,
    required this.title,
    required this.body,
    required this.icon,
    
  }) : super(key: key);

  final String title;
  final String body;
  final IconData icon;
  final DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: null,
      child: Container(
          color: AppColors.black05,
          padding: const EdgeInsets.only(left: 27, top: 15, bottom: 15),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Icon(
                  icon,
                  size: 25,
                  color: AppColors.neutral,
                ),
              ),
              const Flexible(
                flex: 0,
                child: SizedBox(width: 27),
              ),
              Flexible(
                flex: 9,
                child: Column(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Center(
                        child: Text(
                          title,
                          style: AppStyle.light1,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Center(
                        child: Text(
                          body,
                          style: AppStyle.light1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Flexible(
                flex: 0,
                child: SizedBox(width: 27),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  child: Text(
                    "${time.hour.toString()}:${time.minute.toString()}",
                    style: AppStyle.regular.copyWith(fontSize: 14),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  child: IconButton(onPressed: (){

                  }, icon: Icons.delete)
                ),)
            ],
          )),
    );
  }
}
