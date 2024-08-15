import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:testing/utils/code_text.dart';
import 'package:testing/utils/common_button.dart';
import 'package:testing/utils/common_snackbar.dart';

import '../utils/common_widget_classes.dart';
import '../utils/constants.dart';

class MultiThreadingExample extends StatefulWidget {
  const MultiThreadingExample({super.key});

  @override
  State<MultiThreadingExample> createState() => _MultiThreadingExampleState();
}

class _MultiThreadingExampleState extends State<MultiThreadingExample> {
  bool showMoreInfo = false;

  toggleShowMoreInfo() {
    setState(() {
      showMoreInfo = !showMoreInfo;
    });
  }

  heavyTask(num, context) {
    int value = 0;
    for (int i = 0; i < num; i++) {
      value++;
    }
    CommonSnackbar.showSuccess(context: context, message: "Without Isolate : $value");
  }

  isolateFunc(num, context) async {
    ReceivePort receivePort = ReceivePort();
    try {
      await Isolate.spawn(heavyTaskWithIsolate, [receivePort.sendPort, num]);
      final res = await receivePort.first;
      CommonSnackbar.showSuccess(context: context, message: "With Isolate : $res");
    } on Object {
      CommonSnackbar.showError(context: context, message: "Isolation Failed");
      receivePort.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Multi Threading',
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20,),
            Text(
              'MultiThreading in Flutter',
              style:
                  googleFontStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Since We know that Dart is a Single threaded language. When some extensive tasks are performed the Main thread gets stuck hence the Ui is frozen until that task is Completed. To overCome this We can use isolates to open the main thread for displaying UI elements only and provide different thread for running Heavy tasks.',
              style:
                  googleFontStyle(fontSize: 14, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            Image.asset("assets/ball.gif"),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton.mainButton(text: "Run Heavy Task", onTap: (){
                      heavyTask(400000000, context);
                    })
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                      child: CommonButton.mainButton(text: "Run Heavy Task With Isolate", onTap: (){
                        isolateFunc(400000000, context);
                      })
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CommonShowCode(
              codeText: CodeText.multiThreadCode,
            )
          ],
        ),
      ),
    );
  }
}

int heavyTaskWithIsolate(List<dynamic> args) {
  SendPort resultPort = args[0];
  int value = 0;
  for (int i = 0; i < args[1]; i++) {
    value++;
  }
  Isolate.exit(resultPort, value);
}
