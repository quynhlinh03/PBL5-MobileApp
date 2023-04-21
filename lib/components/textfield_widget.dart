import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_styles.dart';
import 'package:pbl5_app/values/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  // final int maxLines;
  final String label;
  final Widget child;

  const TextFieldWidget({
    Key? key,
    required this.label,
    required this.child,
    // required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyle.light1.copyWith(color: AppColors.fontNormal),
        ),
        const SizedBox(height: 7),
        Container(
          child: child,
        ),
      ],
    );
  }
}
