
import 'package:flutter/material.dart';
import 'package:testing/features/flutter_design_patterns/abstruct_factory_DP/abstruct_factory_DP.dart';
import 'package:testing/features/flutter_design_patterns/factory_method_DP/platform_button.dart';
import 'package:testing/utils/code_text.dart';
import '../../../utils/common_widget_classes.dart';
import '../../../utils/constants.dart';

class Abstructfactorydpexample extends StatelessWidget {
  Abstructfactorydpexample({super.key});

  List points = [
    "Provide an interface for creating families of related or dependent objects without specifying their concrete classes.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Abstract Factory',
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
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Current Platform Button", style: googleFontStyle(),),
                            const SizedBox(width: 10,),
                            PlatformButton(Theme.of(context).platform).build((){}, const Text("Click")),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Current Platform Loader", style: googleFontStyle(),),
                            const SizedBox(width: 10,),
                            AbstructFactoryDpPlatformImpl().buildLoader(context),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30,),
            const CommonShowCode(codeText: CodeText.abstractFactoryDPCode,),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
