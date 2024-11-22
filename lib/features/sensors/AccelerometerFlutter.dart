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

class AccelerometerFlutter extends StatefulWidget {
  AccelerometerFlutter({super.key});

  @override
  State<AccelerometerFlutter> createState() => _AccelerometerFlutterState();
}

class _AccelerometerFlutterState extends State<AccelerometerFlutter> {
  List points = [
    "Package : sensors_plus",
    "AccelerometerEvent describes the acceleration of the device, in m/s2, including the effects of gravity. This stream reports raw data from the accelerometer (physical sensor embedded in the mobile device) without any post-processing. The accelerometer is unable to distinguish between the effect of an accelerated movement of the device and the effect of the surrounding gravitational field. This means that, at the surface of Earth, even if the device is completely still, the reading of AccelerometerEvent is an acceleration of intensity 9.8 directed upwards (the opposite of the graviational acceleration). This can be used to infer information about the position of the device (horizontal/vertical/tilted). AccelerometerEvent reports zero acceleration if the device is free falling.",
  ];

  late StreamSubscription _streamSubscription;
  double prevXAngle = 0.0;
  double xAngle = 0.0;
  double prevYAngle = 0.0;
  double yAngle = 0.0;
  double prevZAngle = 0.0;
  double zAngle = 0.0;
  double width = 450;
  double height = 700;

  @override
  void initState() {
    _streamSubscription = accelerometerEventStream().listen(
      (AccelerometerEvent event) {
        print(event);
        setState(() {
          prevXAngle = xAngle;
          xAngle = event.x;
          prevYAngle = yAngle;
          yAngle = double.parse(event.y.toString());
          prevZAngle = zAngle;
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
          "Accelerometer",
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
              width: double.infinity,
              height: 500,
              decoration: const BoxDecoration(color: Colors.black),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    left: xAngle * -3,
                    right: xAngle * 3,
                    top: zAngle * -3,
                    bottom: zAngle * 3,
                    duration: const Duration(milliseconds: 200),
                    child: Center(
                      child: TweenAnimationBuilder(
                          tween: Tween(begin: prevXAngle, end: xAngle),
                          duration: const Duration(milliseconds: 300),
                          builder: (context, double xValue, _) {
                            return TweenAnimationBuilder(
                                tween: Tween(begin: prevZAngle, end: zAngle),
                                duration: const Duration(milliseconds: 300),
                                builder: (context, double zValue, _) {
                                  return Transform(
                                    origin: Offset(width / 2, height / 2),
                                    transform: Matrix4.identity()
                                      ..setEntry(2, 1, 0.001)
                                      ..rotateX(-zValue / 30)
                                      ..rotateY(xValue / 30),
                                    child: Container(
                                      width: width / 2,
                                      height: height / 2,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                CommonImages.demoWallpaper),
                                            fit: BoxFit.cover),
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.grey.shade800),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                            Colors.black.withOpacity(0.3),
                                            blurRadius: 10,
                                            spreadRadius: 8,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }),
                    ),
                  ),
                  Positioned(bottom: 10, left: 0, right: 0, child: Text("Move the Phone to See the effect", style: googleFontStyle(color: Colors.white), textAlign: TextAlign.center,),),
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
              codeText: CodeText.accelerometerSensorCode,
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
