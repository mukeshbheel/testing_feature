
import 'package:flutter/material.dart';
import 'package:testing/features/flutter_design_patterns/factory_method_DP/platform_button.dart';
import 'package:testing/utils/code_text.dart';
import '../../../utils/common_widget_classes.dart';
import '../../../utils/constants.dart';

class FactoryMethodDp extends StatelessWidget {
  FactoryMethodDp({super.key});

  List points = [
    "Define an interface for creating an object, but let subclasses decide which class to instantiate. Factory Method lets a class defer instantiation to sub­classes.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Factory Method',
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20,),
            ListView.separated(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemBuilder: (context, i)=>pointItem(point: points[i]), separatorBuilder: (context, i)=> const SizedBox(height: 10,), itemCount: points.length),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width,
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Android Button", style: googleFontStyle(color: Colors.white),),
                        const SizedBox(width: 10,),
                        PlatformButton(TargetPlatform.android).build((){}, const Text("Click")),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("IOS Button", style: googleFontStyle(color: Colors.white),),
                        const SizedBox(width: 10,),
                        PlatformButton(TargetPlatform.iOS).build((){}, const Text("Click")),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Current Platform Button", style: googleFontStyle(color: Colors.white),),
                        const SizedBox(width: 10,),
                        PlatformButton(Theme.of(context).platform).build((){}, const Text("Click")),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30,),
            const CommonShowCode(codeText: CodeText.factoryMethodDPCode,),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
