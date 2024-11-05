import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/utils/common_button.dart';
import 'package:testing/utils/common_snackbar.dart';
import 'package:http/http.dart' as http;

import '../utils/code_text.dart';
import '../utils/common_widget_classes.dart';
import '../utils/constants.dart';

class SyncVsAsync extends StatefulWidget {
  const SyncVsAsync({super.key});

  @override
  State<SyncVsAsync> createState() => _SyncVsAsyncState();
}

class _SyncVsAsyncState extends State<SyncVsAsync> {
  bool showMoreInfo = false;

  toggleShowMoreInfo() {
    setState(() {
      showMoreInfo = !showMoreInfo;
    });
  }

  void printNumbersSync() {
    for (int i = 1; i <= 3; i++) {
      print(i);
      // Simulate a delay
      sleep(Duration(seconds: 1));
    }
  }

  Future<void> printNumbersAsync() async {
    for (int i = 1; i <= 3; i++) {
      print(i);
      // Simulate a delay without blocking the main thread
      await Future.delayed(Duration(seconds: 1));
    }
  }

  heavyTask(num, context) {
    int value = 0;
    for (int i = 0; i < num; i++) {
      value++;
    }
    CommonSnackbar.showSuccess(context: context, message: "Sync task : $value");
  }

  Future<void> heavyTaskAsync(num, context) async{
    int value = 0;
    for (int i = 0; i < num; i++) {
      value++;
    }
    CommonSnackbar.showSuccess(context: context, message: "Async task : $value");
  }

  List products = [];

  Future<void> fetchProducts() async {
    final response =
    await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if (response.statusCode == 200) {
       final data = jsonDecode(response.body);
       setState(() {
         products = data;
       });
    } else {
      throw Exception('Failed to fetch joke');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Sync Vs Async',
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
              'Sync and Async in Flutter',
              style:
              googleFontStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "In synchronous programming, tasks are executed sequentially, blocking the main thread until each operation completes.",
              style:
              googleFontStyle(fontSize: 14, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Asynchronous programming, on the other hand, allows Flutter applications to perform non-blocking operations, enabling them to remain responsive during tasks that would otherwise cause delays.",
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
                      child: CommonButton.mainButton(text: "Synchronous", onTap: (){
                        heavyTask(400000000, context);
                      })
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                      child: CommonButton.mainButton(text: "Asynchronous", onTap: (){
                         heavyTaskAsync(400000000, context);
                      })
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [

                  Expanded(
                      child: CommonButton.mainButton(text: "Call Api", onTap: ()async{
                        fetchProducts();
                        debugPrint('haalo');
                        for(int i = 0; i<products.length; i++){
                          debugPrint("product $i : ${products[i]['id']}");
                        }
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

