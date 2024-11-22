import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/features/inactivity_tracking/welcome_inactivity_tracking.dart';
import 'package:testing/utils/common_button.dart';
import 'package:testing/utils/constants.dart';
import 'package:testing/utils/extension_custom.dart';
import '../../utils/code_text.dart';
import '../../utils/common_widget_classes.dart';

class InactivityTracking extends StatelessWidget {
  InactivityTracking({super.key});

  List points = [
    "Inactivity Tracking when app is inactive for 15 seconds for both foreground and background.",
    "GestureDetector can be used for tracking the inactivity in the base widget of the app.",
    "Flutter's WidgetBindingObserver mixin can be used to detect the app state if its in foreground or background.",
    "Timer is used for setting time and setting up the callback function after time expires."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Inactivity Tracking",
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
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => pointItem(point: points[i]),
                separatorBuilder: (context, i) => const SizedBox(
                      height: 10,
                    ),
                itemCount: points.length),
            CommonButton.mainButton(text: "Go To Demo", onTap: (){
              Get.to(const WelcomeInactivityTracking());
            }),
            const CommonShowCode(
              codeText: CodeText.inactivityTrackingCode,
            )
          ].addGap(const SizedBox(height: 20)),
        ),
      ),
    );
  }
}
