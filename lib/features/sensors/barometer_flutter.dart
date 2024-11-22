import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:testing/utils/common_snackbar.dart';
import 'package:testing/utils/constants.dart';
import 'package:testing/utils/extension_custom.dart';
import '../../utils/code_text.dart';
import '../../utils/common_widget_classes.dart';

class BarometerFlutter extends StatefulWidget {
  const BarometerFlutter({super.key});

  @override
  State<BarometerFlutter> createState() => _BarometerFlutterState();
}

class _BarometerFlutterState extends State<BarometerFlutter> {
  List points = [
    "Package : sensors_plus",
    "Barometers measure the atmospheric pressure surrounding the sensor, returning values in hectopascals ***hPa***.",
  ];

  late StreamSubscription _streamSubscription;
  double _pressureValue = 0.0;

  @override
  void initState() {
    _streamSubscription = barometerEventStream().listen(
      (BarometerEvent event) {
        print(event.toString());
        setState(() {
          _pressureValue = event.pressure;
        });
      },
      onError: (error) {
        debugPrint(error.toString());

        if(error is PlatformException){
          CommonSnackbar.showError(context: context, message: error.details ?? '');
        }
      },
      cancelOnError: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Barometer",
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.black),
              child: Column(
                children: [
                  Text(
                    "Pressure Value",
                    style: googleFontStyle(color: Colors.white),
                  ),
                  Text(
                    _pressureValue.toString(),
                    style: googleFontStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            _getRadialGauge(),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => pointItem(point: points[i]),
                separatorBuilder: (context, i) => const SizedBox(
                      height: 10,
                    ),
                itemCount: points.length),
            const CommonShowCode(
              codeText: CodeText.barometerSensorCode,
            )
          ].addGap(const SizedBox(height: 20)),
        ),
      ),
    );
  }

  Widget _getRadialGauge() {
    return SfRadialGauge(
        title: const GaugeTitle(
            text: 'Barometer(hPa)',
            textStyle:
            TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 900, maximum: 1100,
              ranges: <GaugeRange>[
            GaugeRange(
                startValue: 900,
                endValue: 1100,
                gradient: const SweepGradient(
                    colors: <Color>[Color(0xFFEDFAFF), Color(0xFF012DFF)],
                    stops: <double>[0.25, 0.75]),
                startWidth: 10,
                endWidth: 15),
          ], pointers: <GaugePointer>[
            NeedlePointer(value: _pressureValue)
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Text(_pressureValue.toStringAsFixed(0),
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold)),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }
}
