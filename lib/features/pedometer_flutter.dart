import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:testing/features/inactivity_tracking/welcome_inactivity_tracking.dart';
import 'package:testing/utils/common_button.dart';
import 'package:testing/utils/common_images.dart';
import 'package:testing/utils/constants.dart';
import 'package:testing/utils/extension_custom.dart';
import '../../utils/code_text.dart';
import '../../utils/common_widget_classes.dart';
import '../utils/sensors_utils.dart';

class PedometerFlutter extends StatefulWidget {
  PedometerFlutter({super.key});

  @override
  State<PedometerFlutter> createState() => _PedometerFlutterState();
}

class _PedometerFlutterState extends State<PedometerFlutter> {
  List points = [
    "PedoMeter is used to track the steps count.",

  ];

  late Stream<StepCount>? stepCountStream;
  late Stream<PedestrianStatus> pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    checkStepCounterAvailability();
    requestPermissions();

    stepCountStream = Pedometer.stepCountStream;
    pedestrianStatusStream = Pedometer.pedestrianStatusStream;

    (await pedestrianStatusStream.listen(onPedestrianStatusChanged))
        .onError(onPedestrianStatusError);

    if (!mounted) return;
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print("event : ${event}");
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  Future<void> requestPermissions() async {
    final status = await Permission.activityRecognition.request();
    if (status != PermissionStatus.granted) {
      log("Permission denied. Pedometer will not work.");
    }else{
      log("Permission granted.");
    }
  }

  void checkStepCounterAvailability() async {
    final isAvailable = await SensorsUtils.isSensorAvailable("STEP_COUNTER");
    print("Step Counter Available: $isAvailable");
    final isAvailableStepDetector = await SensorsUtils.isSensorAvailable("STEP_DETECTOR");
    print("Step Detector Available: $isAvailableStepDetector");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Pedometer",
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            StreamBuilder(
              stream: pedestrianStatusStream!.cast<PedestrianStatus>(),
              builder: (context, snapshot){

                // print("pedestrianStatusStream snapshot: " + snapshot.toString());

                if(snapshot.hasError){
                  return Icon(Icons.error);
                }

                if(snapshot.hasData){
                  // print("has data");
                  final data = snapshot.data;
                  if(data!.status == "walking"){
                    return Image.asset(CommonImages.pedometerWalk);
                  }else if(data.status == "stopped"){
                    return Image.asset(CommonImages.pedometerStanding);
                  }else{
                    return Icon(Icons.error);
                  }
                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Icon(Icons.lock_clock);
                }
                return Icon(Icons.person);

              },
            ),
            StreamBuilder(
              stream: stepCountStream,
              builder: (context, snapshot){

                // print("stepCountStream snapshot: " + snapshot.toString());
                // final data = snapshot.data;
                // CommonButton.mainButton(text: "${data?.steps}");
                if(snapshot.hasError){
                  return Icon(Icons.error);;
                }

                if(snapshot.hasData){
                  final data = snapshot.data;
                  return CommonButton.mainButton(text: data!.steps.toString());
                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Icon(Icons.lock_clock);
                }
                return Icon(Icons.person);

              },
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
              codeText: CodeText.inactivityTrackingCode,
            )
          ].addGap(const SizedBox(height: 20)),
        ),
      ),
    );
  }
}
