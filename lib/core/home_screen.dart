import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/animated_sitsmart_appbar.dart';
import '/components/timer.dart';

import '/models/timermodel.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var controller = Get.put(TimerModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: Get.mediaQuery.padding.top),
          Container(
            height: Get.size.height - Get.mediaQuery.padding.top,
            width: Get.size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SitSmartAppBar(),
                SliverToBoxAdapter(
                  child: TimerCard(),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xffbacfe0).withOpacity(0.6),
              const Color(0xffe9dbd8).withOpacity(0.7),
            ],
          ),
        ),
        child: GetBuilder<TimerModel>(builder: (controller) {
          return FloatingActionButton(
            onPressed: () {
              controller.changeTimerState();
              if (controller.state == TimerState.play) {
                controller.startTimer();
              } else {
                controller.stopTimer();
              }
            },
            child: Icon(
                controller.state == TimerState.pause
                    ? Icons.play_arrow_rounded
                    : Icons.stop_rounded,
                color: Colors.black,
                size: 55),
            tooltip: controller.state == TimerState.pause ? 'play' : 'pause',
            backgroundColor: Colors.transparent,
            focusColor: Colors.transparent,
            elevation: 0,
          );
        }),
      ),
    );
  }
}
