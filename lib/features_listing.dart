import 'dart:math';

import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing/features/accordion_page.dart';
import 'package:testing/features/clippath_custom_container_shape.dart';
import 'package:testing/features/custom_spinner.dart';
import 'package:testing/features/custome_half_spinner.dart';
import 'package:testing/features/dynamic_components.dart';
import 'package:testing/features/fl_charts.dart';
import 'package:testing/features/flutter_animation_basics/flutter_animation_basics.dart';
import 'package:testing/features/flutter_design_patterns/flutter_design_pattern.dart';
import 'package:testing/features/flutter_ludo/flutter_ludo.dart';
import 'package:testing/features/mapples_function.dart';
import 'package:testing/features/oval_shadow.dart';
import 'package:testing/features/sync_vs_async.dart';
import 'package:testing/features/web_socket_screen.dart';
import 'package:testing/utils/constants.dart';

import 'features/custom_clock.dart';
import 'features/custom_painting_widgets.dart';
import 'features/method_channel.dart';
import 'features/multi_threading.dart';

class FeaturesListings extends StatelessWidget {
  FeaturesListings({super.key});

  List features = [
    {
      'title': 'Accordian',
      'screen': const AccordionPage(),
      'showWidget': false,
      'component': null
    },
    {
      'title': 'mapple',
      'screen': const MapplesFunction(),
      'showWidget': false,
      'component': null
    },
    {
      'title': 'fl_charts',
      'screen': const FlCharts(),
      'showWidget': false,
      'component': null
    },
    {
      'title': 'oval shadow',
      'screen': const OvalShadow(),
      'showWidget': false,
      'component': null
    },
    {
      'title': 'Custom painting widgets',
      'screen': const CustomPaintingWidgets(),
      'showWidget': false,
      'component': null
    },
    {
      'title': 'MultiThreading',
      'screen': const MultiThreadingExample(),
      'showWidget': false,
      'component': null
    },
    {
      'title': 'Method Channel',
      'screen': const MethodChannelExample(),
      'showWidget': false,
      'component': null
    },
    {
      'title': 'Clip Path custom Container',
      'screen': const ClippathCustomContainerShape(),
      'showWidget': false,
      'component': null
    },
    {
      'title': 'Flutter Animation Basics',
      'screen': FlutterAnimationBasics(),
      'showWidget': false,
      'component': null
    },
    {
      'title': 'Flutter Ludo',
      'screen': FlutterLudo(),
      'showWidget': false,
      'component': null
    },
    {
      'title': 'Spinner',
      'screen': CustomSpinner(),
      'showWidget': false,
      'component': null
    },
    {
      'title': 'Custom Clock',
      'screen': CustomClock(),
      'showWidget': true,
      'component': CustomClockWidget
    },
    {
      'title': 'Sync vs Async',
      'screen': SyncVsAsync(),
      'showWidget': true,
      'component': null
    },
    {
      'title': 'WebSocket',
      'screen': WebSocketScreen(),
      'showWidget': true,
      'component': null
    },

    {
      'title': 'Custom Half Spinner',
      'screen': CustomHalfSpinner(),
      'showWidget': true,
      'component': null
    },

    {
      'title': 'Flutter Design Pattern',
      'screen': FlutterDesignPattern(),
      'showWidget': true,
      'component': null
    },
    {
      'title': 'Dynamic Components',
      'screen': DynamicComponents(),
      'showWidget': true,
      'component': null
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Features',
            style: googleFontStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    ...features.map((item) => InkWell(
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
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    item['title'].toString().capitalizeFirst!,
                                    style: googleFontStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  if (item['title'].toString().toLowerCase() ==
                                      "custom clock")
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: CustomClockWidget(
                                        size: MediaQuery.of(context).size,
                                      ),
                                    )
                                ],
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
      ),
    );
  }
}
