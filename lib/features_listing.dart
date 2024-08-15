import 'dart:math';

import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing/features/accordion_page.dart';
import 'package:testing/features/clippath_custom_container_shape.dart';
import 'package:testing/features/fl_charts.dart';
import 'package:testing/features/mapples_function.dart';
import 'package:testing/features/oval_shadow.dart';
import 'package:testing/utils/constants.dart';

import 'features/custom_painting_widgets.dart';
import 'features/method_channel.dart';
import 'features/multi_threading.dart';

class FeaturesListings extends StatelessWidget {
  FeaturesListings({super.key});

  List features = [
    {
      'title': 'Accordian',
      'screen': const AccordionPage()
    },
    {
      'title': 'mapple',
      'screen': const MapplesFunction()
    },
    {
      'title': 'fl_charts',
      'screen': const FlCharts()
    },
    {
      'title': 'oval shadow',
      'screen': const OvalShadow()
    },
    {
      'title': 'Custom painting widgets',
      'screen': const CustomPaintingWidgets()
    },
    {
      'title': 'MultiThreading',
      'screen': const MultiThreadingExample()
    },

    {
      'title': 'Method Channel',
      'screen': const MethodChannelExample()
    },

    {
      'title': 'Clip Path custom Container',
      'screen': const ClippathCustomContainerShape()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('Features', style: googleFontStyle(color: Colors.white),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Wrap(
                children: [
                  ...features.map((item)=>InkWell(
                    onTap: (){
                      Get.to(item['screen']);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      padding: const EdgeInsets.all(2),
                      width: (MediaQuery.of(context).size.width-60)/3,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: getRandomColor(),
                      ),
                      child: Center(
                        child: Text(item['title'].toString().capitalizeFirst!, style: googleFontStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
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
