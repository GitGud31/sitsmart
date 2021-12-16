import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sitsmart/models/timermodel.dart';

class TimerCard extends StatelessWidget {
  TimerCard({Key? key}) : super(key: key);
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimerModel>(builder: (controller) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: Get.size.height * 0.35,
        width: Get.size.width,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: (Get.size.height * 0.35) * 0.6,
              width: (Get.size.height * 0.35) * 0.6,
              child: CircularProgressIndicator(
                value: controller.getValue(),
                backgroundColor: Colors.grey,
                color: Colors.blueAccent,
                strokeWidth: 10,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${controller.hour}:${controller.minutes}:${controller.seconds}',
              style: const TextStyle(
                fontSize: 45,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    });
  }
}
