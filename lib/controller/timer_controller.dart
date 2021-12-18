import 'dart:async';

import 'package:get/get.dart';

enum TimerState { play, pause }

class TimerController extends GetxController {
  int limit = 3000;
  RxInt secondsPassBy = 0.obs;
  RxInt hour = 0.obs;
  RxInt minutes = 50.obs;
  RxInt seconds = 0.obs;
  TimerState state = TimerState.pause;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsPassBy.value == limit) {
        state = TimerState.pause;
        stopTimer();
        update();
      } else {
        seconds.value -= 1;
        if (seconds.value == -1) {
          minutes.value -= 1;
          if (minutes.value == -1) {
            hour.value -= 1;
            minutes.value = 59;
          }
          seconds.value = 59;
        }
        secondsPassBy++;
        update();
      }
    });
  }

  void stopTimer() {
    state = TimerState.pause;
    secondsPassBy.value = 0;
    hour.value = 0;
    minutes.value = 1; //TODO: reset to value to 50. Setting other values than 50, reveals a display bug.
    seconds.value = 0;
    timer?.cancel();
  }

  double getValue() {
    return (((minutes.value * 60) + seconds.value) / limit);
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
