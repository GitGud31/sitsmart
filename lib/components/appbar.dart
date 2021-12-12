// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import '/core/infoscreen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: Get.mediaQuery.padding.top),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(width: Get.size.width),
            GradientText(
              'sitsmart',
              style: Get.theme.textTheme.bodyText1 as TextStyle,
              gradient: const LinearGradient(
                  colors: [Color(0xff007991), Color(0xff78ffd6)],
                  stops: [0.5, 0.5]),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                icon: Icon(Icons.info,
                    color: Get.theme.iconTheme.color,
                    size: Get.theme.iconTheme.size),
                onPressed: () {
                  Get.toNamed(InformationScreen.routeName);
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
