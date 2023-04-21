import 'package:flutter/cupertino.dart';

import '../values/app_styles.dart';

class adviceBox extends StatelessWidget {
  final String title;
  final String percent;
  final String content;
  final Color color;
  const adviceBox({
    super.key,
    required this.title,
    required this.percent,
    required this.content,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
          top: 21,
          bottom: 20,
          left: 25,
          right: 25,
        ),
        width: 336,
        // height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: color),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(
                    title,
                    style: AppStyle.regular18white,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    percent,
                    style: AppStyle.regular18white,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 12,
              ),
              child: Text(
                content,
                style: AppStyle.light1white,
              ),
            ),
          ],
        ));
  }
}
