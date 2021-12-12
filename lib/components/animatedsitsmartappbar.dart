// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '/core/infoscreen.dart';

class SitSmartAppBar extends StatefulWidget {
  const SitSmartAppBar({Key? key}) : super(key: key);

  @override
  State<SitSmartAppBar> createState() => _SitSmartAppBarState();
}

class _SitSmartAppBarState extends State<SitSmartAppBar>
    with TickerProviderStateMixin {
  AnimationController? movementController;
  Animation? animation;

  AnimationController? sizeController;
  Animation? sizeAnimation;

  @override
  void initState() {
    movementController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    animation = Tween<double>(begin: Get.size.width, end: 0).animate(
        CurvedAnimation(
            parent: movementController as AnimationController,
            curve: Curves.linear));
    movementController?.forward();

    sizeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));
    sizeAnimation = Tween<double>(begin: 600, end: 0).animate(CurvedAnimation(
        parent: sizeController as AnimationController, curve: Curves.linear));

    sizeController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    movementController?.dispose();
    sizeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Get.theme.backgroundColor,
      flexibleSpace: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/images/sitsmartbanner.png'),
          AnimatedBuilder(
            animation: movementController as AnimationController,
            builder: (ctx, child) {
              return Positioned(
                right: animation!.value,
                child: child as Widget,
              );
            },
            child: AnimatedBuilder(
              animation: sizeController as AnimationController,
              builder: (ctx, child) {
                return Lottie.asset('assets/animations/plane.json',
                    height: sizeAnimation!.value);
              },
            ),
          ),
        ],
      ),
      expandedHeight: 230,
      actions: [
        IconButton(
          icon: Icon(Icons.info_outline_rounded,
              color: Get.theme.iconTheme.color, size: Get.theme.iconTheme.size),
          onPressed: () {
            Get.toNamed(InformationScreen.routeName);
          },
        )
      ],
    );
  }
}
