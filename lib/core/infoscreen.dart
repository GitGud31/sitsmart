import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);
  static const routeName = "/sitsmart-info";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: Get.mediaQuery.padding.top),
          ),
          SliverToBoxAdapter(
            child: Lottie.asset(
                'assets/animations/45551-men-relaxing-on-working-chair.json'),
          )
        ],
      ),
    );
  }
}
