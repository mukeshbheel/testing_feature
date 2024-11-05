import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/features/flutter_design_patterns/abstruct_factory_DP/AbstructFactoryDPExample.dart';
import 'package:testing/features/flutter_design_patterns/factory_method_DP/factory_method_DP.dart';
import 'package:testing/features/flutter_design_patterns/prototype_%20DP/prototype_DP_example.dart';
import 'package:testing/features/flutter_design_patterns/singleton_DP/single_DP_example.dart';
import 'package:testing/utils/constants.dart';

import 'adapter_DP/adapter_DP_example.dart';

class FlutterDesignPattern extends StatelessWidget {
  FlutterDesignPattern({super.key});

  List featureDesignPatterns = [
    {'title': 'Factory Method', 'screen': FactoryMethodDp()},
    {'title': 'Abstract Factory', 'screen': Abstructfactorydpexample()},
    {'title': 'Singleton', 'screen': SingleDpExample()},
    {'title': 'Prototype', 'screen': PrototypeDpExample()},
    {'title': 'Adapter', 'screen': AdapterDpExample()},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('Flutter Design Patterns',
              style: googleFontStyle(color: Colors.white)),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Wrap(
                children: [
                  ...featureDesignPatterns.map((item) => InkWell(
                        onTap: () {
                          Get.to(item['screen']);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          padding: const EdgeInsets.all(2),
                          width: (MediaQuery.of(context).size.width - 60) / 3,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: getRandomColor(),
                          ),
                          child: Center(
                            child: Text(
                              item['title'].toString().capitalizeFirst!,
                              style: googleFontStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
