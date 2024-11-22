import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class InactivityController extends GetxController{

  Timer? inactivityTimer;
  final Duration inactivityDuration = const Duration(seconds: 15);

  void startBackgroundTimer(){
    log("_startBackgroundTimer called");
    inactivityTimer?.cancel();
    inactivityTimer = Timer(inactivityDuration, _onBackgroundInactivityDetected);
  }

  void cancelBackgroundTimer() {
    print("_cancelBackgroundTimer called");
    inactivityTimer?.cancel();
  }

  void _onBackgroundInactivityDetected(){
    // do logout and send to welcome screen
    Get.until((route) => route.settings.name == '/WelcomeInactivityTracking');
    if(Get.context != null) {
      showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
        title: Text('Inactivity Detected', style: googleFontStyle(),),
        content: Text('You have been inactive for ${inactivityDuration.inSeconds} seconds. Please Login again to Continue.', style: googleFontStyle(),),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('OK', style: googleFontStyle(),),
          ),
        ],
      ),
    );
    }
  }

}