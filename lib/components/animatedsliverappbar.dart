import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class AnimatedSliverAppBar extends StatefulWidget {
  const AnimatedSliverAppBar({Key? key}) : super(key: key);

  @override
  State<AnimatedSliverAppBar> createState() => _AnimatedSliverAppBarState();
}

class _AnimatedSliverAppBarState extends State<AnimatedSliverAppBar>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4300));
    animation = Tween<double>(begin: Get.size.width, end: 0).animate(
        CurvedAnimation(
            parent: controller as AnimationController, curve: Curves.linear));
    controller?.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Get.theme.backgroundColor,
      flexibleSpace: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(width: Get.size.width),
          Image.asset('assets/images/aboutusbanner.png'),
          AnimatedBuilder(
            animation: controller as AnimationController,
            builder: (ctx, child) {
              return Positioned(
                right: animation!.value,
                child: child as Widget,
              );
            },
            child: Lottie.asset(
              'assets/animations/walking.json',
              height: 150,
            ),
          ),
        ],
      ),
      expandedHeight: 230,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Get.theme.iconTheme.color,
          size: Get.theme.iconTheme.size,
        ),
        tooltip: 'back',
      ),
    );
  }
}
