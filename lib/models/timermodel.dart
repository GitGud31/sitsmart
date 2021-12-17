import 'dart:async';

import 'package:get/get.dart';

enum TimerState { play, pause }

class TimerModel extends GetxController {
  int limit = 3000;
  RxInt secondsPassBy = 0.obs;
  RxInt hour = 0.obs;
  RxInt minutes = 0.obs;
  RxInt seconds = 0.obs;
  TimerState state = TimerState.pause;
  Timer? timer;
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsPassBy.value == limit) {
        state = TimerState.pause;
        update();
        timer.cancel();
      } else {
        seconds.value = (seconds + 1) % 60 as int;
        secondsPassBy++;
        if (seconds.value == 0) {
          minutes.value += 1;
        }
        if (minutes.value == 60) {
          minutes.value = 0;
          hour.value += 1;
        }
        update();
      }
    });
  }

  void stopTimer() {
    secondsPassBy.value = 0;
    hour.value = 0;
    minutes.value = 0;
    seconds.value = 0;
    state = TimerState.pause;
    timer?.cancel();
  }

  double getValue() {
    return 1 - (((minutes.value * 60) + seconds.value) / limit);
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
