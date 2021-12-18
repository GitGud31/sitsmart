import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sitsmart/utils/routes_name.dart';

import 'controller/timer_controller.dart';
import 'core/info_screen.dart';
import 'core/home_screen.dart';

void main() {
  Get.put(TimerController());

  runApp(
    const SitSmart(),
  );
}

class SitSmart extends StatelessWidget {
  const SitSmart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sitsmart',
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        highlightColor: Colors.blueGrey,
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 30,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'Magilio',
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ),
      getPages: [
        GetPage(name: RoutesName.root, page: () => const HomeScreen()),
        GetPage(name: RoutesName.sitsmartInfo, page: () => const InformationScreen()),
      ],
      home: const HomeScreen(),
    );
  }
}
