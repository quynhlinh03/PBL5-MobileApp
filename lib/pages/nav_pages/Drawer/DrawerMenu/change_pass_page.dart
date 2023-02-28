import 'package:flutter/material.dart';

import '../../../../values/app_colors.dart';

class ChangePassPage extends StatefulWidget {
  const ChangePassPage({ Key? key }) : super(key: key);

  @override
  _ChangePassPageState createState() => _ChangePassPageState();
}

class _ChangePassPageState extends State<ChangePassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: AppColors.neutral),
      ),
    );
  }
}