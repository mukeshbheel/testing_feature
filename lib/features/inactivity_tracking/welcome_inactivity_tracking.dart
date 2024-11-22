import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/features/inactivity_tracking/inactivity_controller.dart';
import 'package:testing/features/inactivity_tracking/login_inactivity_tracking.dart';
import 'package:testing/utils/constants.dart';

class WelcomeInactivityTracking extends StatefulWidget {
  const WelcomeInactivityTracking({super.key});

  @override
  State<WelcomeInactivityTracking> createState() => _WelcomeInactivityTrackingState();
}

class _WelcomeInactivityTrackingState extends State<WelcomeInactivityTracking> with WidgetsBindingObserver {

  final InactivityController inactivityController = Get.put(InactivityController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }





  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    inactivityController.inactivityTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    // if(state == AppLifecycleState.paused){
    //   _startBackgroundTimer();
    // }else
    if(state == AppLifecycleState.resumed){
      inactivityController.startBackgroundTimer();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          inactivityController.startBackgroundTimer();
        },      // Reset timer on taps
        onPanUpdate: (_) => inactivityController.startBackgroundTimer(),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.lightBlueAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome!',
                style: googleFontStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Let\'s get started.',
                style: googleFontStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Get.to(LoginInactivityTracking());
                  inactivityController.startBackgroundTimer();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue, backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: googleFontStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


