import 'package:flutter/material.dart';
import 'package:pbl5_app/values/app_styles.dart';
import 'package:pbl5_app/values/app_colors.dart';

class TextFieldWidget extends StatefulWidget {
  // final int maxLines;
  final String label;
  final String text;
  // final ValueChanged<String> onChanged;

  const TextFieldWidget({
    Key? key,
    // this.maxLines = 1,
    required this.label,
    required this.text,
    // required this.onChanged,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: AppStyle.light1.copyWith(color: AppColors.fontNormal),
          ),
          const SizedBox(height: 7),
          TextField(
            cursorHeight: 12,
            style: AppStyle.light2.copyWith(color: AppColors.fontNormal),
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            // maxLines: widget.maxLines,
            // onChanged: widget.onChanged,
          ),
        ],
      );
}
