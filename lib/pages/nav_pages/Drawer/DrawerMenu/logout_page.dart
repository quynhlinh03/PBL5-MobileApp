import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_colors.dart';

class LogOutPage extends StatefulWidget {
  const LogOutPage({ Key? key }) : super(key: key);

  @override
  _LogOutPageState createState() => _LogOutPageState();
}

class _LogOutPageState extends State<LogOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.neutral),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}