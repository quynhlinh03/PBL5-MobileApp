import 'package:flutter/material.dart';
import '../pages/signup_pages/login_screen.dart';
import '../values/app_colors.dart';
import '../values/app_styles.dart';

class RowViewIndex extends StatelessWidget {
  final String title;
  final String decription;
  final Function() press;
  final String image;

  const RowViewIndex({
    super.key,
    required this.title,
    required this.decription,
    required this.press,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 15,
                      bottom: 5,
                    ),
                    child: Text(
                      title,
                      style: AppStyle.mediumblack,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 4,
                      left: 15,
                      bottom: 10,
                    ),
                    child: Text(
                      decription,
                      style: AppStyle.light1,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 15,
                    ),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const LoginScreen();
                                },
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.greenGray,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60.0)),
                            minimumSize: const Size(74, 35),
                          ),
                          child:
                              const Text("View", style: AppStyle.mediumwhite16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  bottomLeft: Radius.circular(32)),
              child: Image.asset(image),
            ),
          ),
        ],
      ),
    );
  }
}
