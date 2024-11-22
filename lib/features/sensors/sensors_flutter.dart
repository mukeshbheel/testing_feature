import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/features/sensors/AccelerometerFlutter.dart';
import 'package:testing/features/sensors/barometer_flutter.dart';
import 'package:testing/features/sensors/magnetometer_flutter.dart';
import 'package:testing/utils/constants.dart';

import 'gyroscope_flutter.dart';


class SensorsFlutter extends StatelessWidget {
  SensorsFlutter({super.key});

  List sensors = [
    {'title': 'Accelerometer', 'screen': AccelerometerFlutter()},
    {'title': 'Gyroscope', 'screen': GyroscopeFlutter()},
    {'title': 'MagnetoMeter', 'screen': MagnetometerFlutter()},
    {'title': 'Barometer', 'screen': BarometerFlutter()},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('Sensors',
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
                  ...sensors.map((item) => InkWell(
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
