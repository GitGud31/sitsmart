import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/components/animatedsliverappbar.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);
  static const routeName = "/sitsmart-info";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        body: const CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const AnimatedSliverAppBar(),
          ],
        ),
      ),
    );
  }
}
