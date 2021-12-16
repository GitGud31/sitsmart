import 'package:get/get.dart';
import 'package:flutter/material.dart';

enum TimerState { play, pause }

class TimerModel extends GetxController {
  var hour = 0.obs;
  var minutes = 50.obs;
  var seconds = 00.obs;
  TimerState state = TimerState.pause;

  double getValue() {
    return ((minutes.value * 60) + seconds.value) / 3000;
  }

  void changeTimerState() {
    if (state == TimerState.play) {
      state = TimerState.pause;
      update();
    } else {
      state = TimerState.play;
      update();
    }
  }
}
