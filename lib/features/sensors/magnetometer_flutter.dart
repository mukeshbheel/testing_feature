import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:testing/utils/constants.dart';
import 'package:testing/utils/extension_custom.dart';
import '../../utils/code_text.dart';
import '../../utils/common_snackbar.dart';
import '../../utils/common_widget_classes.dart';
import 'dart:math';

class MagnetometerFlutter extends StatefulWidget {
  const MagnetometerFlutter({super.key});

  @override
  State<MagnetometerFlutter> createState() => _MagnetometerFlutterState();
}

class _MagnetometerFlutterState extends State<MagnetometerFlutter> {
  List points = [
    "Package : sensors_plus",
    "Magnetometers measure the ambient magnetic field surrounding the sensor, returning values in microteslas ***μT*** for each three-dimensional axis.",
  ];

  late StreamSubscription _streamSubscription;
  double xAngle = 0.0;
  double yAngle = 0.0;
  double zAngle = 0.0;
  double _magneticValue = 0.0;

  @override
  void initState() {
    _streamSubscription = magnetometerEventStream().listen(
      (MagnetometerEvent event) {
        final magneticField = sqrt(event.x*event.x + event.y*event.y + event.z*event.z);
        setState(() {
          _magneticValue = magneticField;
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
          "Magnetometer",
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
                    "Magnetic Value",
                    style: googleFontStyle(color: Colors.white),
                  ),
                  Text(
                    _magneticValue.toString(),
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
              codeText: CodeText.magnetometerSensorCode,
            )
          ].addGap(const SizedBox(height: 20)),
        ),
      ),
    );
  }

  Widget _getRadialGauge() {
    return SfRadialGauge(
        title: const GaugeTitle(
            text: 'MagnetoMeter',
            textStyle:
            TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 150,
              ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: 150,
                gradient: const SweepGradient(
                    colors: <Color>[Color(0xFFEDFAFF), Color(0xFF012DFF)],
                    stops: <double>[0.25, 0.75]),
                startWidth: 10,
                endWidth: 15),
          ], pointers: <GaugePointer>[
            NeedlePointer(value: _magneticValue)
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Text(_magneticValue.toStringAsFixed(0),
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
