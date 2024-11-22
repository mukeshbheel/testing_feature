import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:testing/utils/common_images.dart';
import 'package:testing/utils/constants.dart';
import 'package:testing/utils/extension_custom.dart';
import '../../utils/code_text.dart';
import '../../utils/common_snackbar.dart';
import '../../utils/common_widget_classes.dart';

class GyroscopeFlutter extends StatefulWidget {
  const GyroscopeFlutter({super.key});

  @override
  State<GyroscopeFlutter> createState() => _GyroscopeFlutterState();
}

class _GyroscopeFlutterState extends State<GyroscopeFlutter> {
  List points = [
    "Package : sensors_plus",
    "Gyroscopes measure the rate or rotation of the device in 3D space.",
    "Rate of rotation around the x, y and z axes measured in rad/s."
  ];

  late StreamSubscription _streamSubscription;
  double xAngle = 0.0;
  double yAngle = 0.0;
  double zAngle = 0.0;
  double width = 450;
  double height = 700;
  DateTime timeStamps = DateTime.now();

  @override
  void initState() {
    _streamSubscription = gyroscopeEventStream().listen(
      (GyroscopeEvent event) {
        setState(() {
          xAngle = event.x;
          timeStamps = event.timestamp;
          yAngle = double.parse(event.y.toString());
          zAngle = double.parse(event.z.toString());
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
          "Gyroscope",
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
                    "Rotate Velocity Z Axis",
                    style: googleFontStyle(color: Colors.white),
                  ),
                  Text(
                    zAngle.toString(),
                    style: googleFontStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 500,
              decoration: const BoxDecoration(color: Colors.black),
              child: Stack(
                children: [
                  AnimatedContainer(
                    // turns: -zAngle/(2*pi),
                    duration: const Duration(milliseconds: 100),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationZ(-zAngle),
                      // angle: -zAngle/(2*pi),
                      child: Center(
                          child: Container(
                        width: width / 2,
                        height: height / 2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(CommonImages.demoWallpaper),
                              fit: BoxFit.cover),
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey.shade800),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 8,
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Text(
                      "Move the Phone to See the effect",
                      style: googleFontStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => pointItem(point: points[i]),
                separatorBuilder: (context, i) => const SizedBox(
                      height: 10,
                    ),
                itemCount: points.length),
            const CommonShowCode(
              codeText: CodeText.gyroscopeSensorCode,
            )
          ].addGap(const SizedBox(height: 20)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }
}
