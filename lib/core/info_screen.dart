import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/animated_sliver_appbar.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const lightStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 1,
      fontFamily: 'Product Sans',
    );

    const heavyStyle = TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
      fontFamily: 'Product Sans',
    );

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Get.mediaQuery.padding.top,
          ),
          Container(
            height: Get.size.height - Get.mediaQuery.padding.top,
            width: Get.size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue,
                  Colors.white,
                ],
              ),
              // image: DecorationImage(
              //     image: AssetImage('assets/images/aboutusbg.png'),
              //     fit: BoxFit.cover),
            ),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const AnimatedSliverAppBar(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: 'sitsmart', style: heavyStyle),
                          TextSpan(
                              text:
                                  ' is an application that is designed to remind you the',
                              style: lightStyle),
                          TextSpan(
                              text: ' importance of taking a break',
                              style: heavyStyle),
                          TextSpan(
                              text:
                                  ' after every hour of sitting in front of your laptop. this application is made for those who spend most of their day in front of their laptop, computer or mobile screen and do not take frequent breaks. this application comes with a timer that you can start with just a single press and after the set limit, it will remind you to stand up and take a break for 10 minutes. ',
                              style: lightStyle),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
