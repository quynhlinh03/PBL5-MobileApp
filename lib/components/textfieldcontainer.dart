import 'package:flutter/material.dart';
import '/values/app_colors.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 26),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: size.width * 0.8,
      height: 61,
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
