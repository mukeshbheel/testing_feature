import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/utils/common_button.dart';
import 'package:testing/utils/common_snackbar.dart';

import '../utils/code_text.dart';
import '../utils/common_widget_classes.dart';
import '../utils/constants.dart';

class MethodChannelExample extends StatefulWidget {
  const MethodChannelExample({super.key});

  @override
  State<MethodChannelExample> createState() => _MultiThreadingExampleState();
}

class _MultiThreadingExampleState extends State<MethodChannelExample> {
  static const platform = MethodChannel("battery_channel");
  String _batteryLevel = "Unknown battery level";

  Future<void> _getBatterylevel(context) async {
    try {
      final result = await platform.invokeMethod<int>("getBatteryLevel");
      setState(() {
        _batteryLevel = 'Battery Level is $result';
      });
    } on MissingPluginException {
      debugPrint('MissingPluginException');
      CommonSnackbar.showError(
          context: context, message: "Failed to get battery level");
    } on PlatformException catch (e) {
      CommonSnackbar.showError(
          context: context,
          message: "Failed to get battery level : ${e.message}");
    }
  }

  bool showMoreInfo = false;

  toggleShowMoreInfo() {
    setState(() {
      showMoreInfo = !showMoreInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Method Channel',
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Method Channel in Flutter',
                style:
                    googleFontStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                _batteryLevel,
                style:
                    googleFontStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: CommonButton.mainButton(
                  onTap: () async {
                    await _getBatterylevel(context);
                  },
                  text: "Get Battery Level",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CommonShowCode(
                codeText: CodeText.methodChannelCode,
              )
            ],
          ),
        ),
      ),
    );
  }
}
