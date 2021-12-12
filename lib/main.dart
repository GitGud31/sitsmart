import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/infoscreen.dart';
import '/core/homescreen.dart';

void main() {
  runApp(SitSmart());
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
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.blueGrey,
          size: 30,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'Magilio',
            fontSize: 45,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      getPages: [
        GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),
        GetPage(
            name: InformationScreen.routeName, page: () => InformationScreen())
      ],
      home: HomeScreen(),
    );
  }
}
