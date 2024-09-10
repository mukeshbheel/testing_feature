import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/features/flutter_animation_basics/animation_example1.dart';
import 'package:testing/features/flutter_animation_basics/animation_example2.dart';
import 'package:testing/features/flutter_animation_basics/animation_example3.dart';
import 'package:testing/features/flutter_animation_basics/animation_example5.dart';
import 'package:testing/utils/constants.dart';

import 'animation_example4.dart';

class FlutterAnimationBasics extends StatelessWidget {
  FlutterAnimationBasics({super.key});

  List featureAnimations = [
    {'title': 'tween & rotation', 'screen': const AnimationExample1()},
    {'title': 'Rotate & Flip', 'screen': const AnimationExample2()},
    {'title': '3D Rotating Cube', 'screen': const AnimationExample3()},
    {
      'title': 'Custom Clipper & Tween AnimationBuilder',
      'screen': const AnimationExample4()
    },
    {
      'title': 'Polygon with increasing sides',
      'screen': const AnimationExample5()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('Flutter Animation Basics',
              style: googleFontStyle(color: Colors.white)),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Wrap(
                children: [
                  ...featureAnimations.map((item) => InkWell(
                        onTap: () {
                          Get.to(item['screen']);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          padding: const EdgeInsets.all(2),
                          width: (MediaQuery.of(context).size.width - 60) / 3,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: getRandomColor(),
                          ),
                          child: Center(
                            child: Text(
                              item['title'].toString().capitalizeFirst!,
                              style: googleFontStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
