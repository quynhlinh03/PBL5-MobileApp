import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_styles.dart';
import 'package:pbl5_app/values/app_colors.dart';

class CustomNotification extends StatelessWidget {

  const CustomNotification({
      Key? key,
      required this.name,
      required this.icon,
      required this.time,
      }) : super(key: key);

  final String name;
  final IconData icon;
  final String time;

  @override
  Widget build(BuildContext context){
    return Container(
      color: AppColors.black05,
      padding: const EdgeInsets.only(left: 27, top: 15, bottom:15),
      child: Row(
        children: [
          Flexible(
            flex:2,
            child: Icon(
              icon,
              size: 25,
              color: AppColors.neutral,
            ),
          ),
          Flexible(
            flex:0,
            child: SizedBox(width: 27),
          ),
          Flexible(
            flex:9,
            child: Text(
              name,
              style: AppStyle.light1,
            ), 
          ),
          Flexible(
            flex:0,
            child: SizedBox(width: 27),
          ),
          Flexible(
            flex:3,
            child: Container(
                child: Text(
                time,
                style: AppStyle.regular.copyWith(fontSize: 14),
              ),
            ),
          ),
        ],
      )
    );
  }
}
