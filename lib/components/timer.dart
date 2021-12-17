import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:sitsmart/models/timermodel.dart';

class TimerCard extends StatelessWidget {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimerModel>(
      builder: (controller) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: Get.size.height * 0.35,
          width: Get.size.width,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ElevatedButton(
            onPressed: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  height: (Get.size.height * 0.35) * 0.6,
                  width: (Get.size.height * 0.35) * 0.6,
                  child: CircularProgressIndicator(
                    value: controller.getValue(),
                    valueColor:
                        AlwaysStoppedAnimation<Color?>(Colors.indigo[300]),
                    backgroundColor: Colors.black12,
                    color: Colors.white30,
                    strokeWidth: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Builder(builder: (context) {
                  String seconds = (controller.seconds.value < 10)
                      ? "0${controller.seconds}"
                      : "${controller.seconds}";
                  String minutes = (controller.minutes.value < 10)
                      ? "0${controller.minutes}"
                      : "${controller.minutes}";
                  String hours = (controller.hour.value < 10)
                      ? "0${controller.hour}"
                      : "${controller.hour}";
                  return Text(
                    '$hours:$minutes:$seconds',
                    style: const TextStyle(
                      fontSize: 45,
                      color: Colors.black87,
                      fontWeight: FontWeight.w900,
                    ),
                  );
                }),
              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              elevation: 0,
            ),
          ),
        );
      },
    );
  }
}
