import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/components/animatedsitsmartappbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SitSmartAppBar(),
          ],
        ),
      ),
    );
  }
}
