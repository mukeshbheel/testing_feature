import 'package:flutter/material.dart';
import '../../utils/code_text.dart';
import '../../utils/common_widget_classes.dart';
import '../../utils/constants.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List points = [
    "Adding a Fixed Colum Container before drawer",
    "Create a different Navigator for the Inner Scaffold to separate drawer Navigation from outer Scaffold.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home" , style: googleFontStyle(),),
        centerTitle: true,
      ),
      drawer: Drawer(
        width: 200,
        backgroundColor: Colors.brown,
        child: Column(
          children: [
            const DrawerHeader(child: Icon(Icons.person),),
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text("Close", style: googleFontStyle(color: Colors.white),))
          ],
        ),
      ),
      drawerEnableOpenDragGesture: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20,),
            Text(
              'Internal Drawer in web',
              style:
              googleFontStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => pointItem(point: points[i]),
                separatorBuilder: (context, i) => const SizedBox(
                  height: 10,
                ),
                itemCount: points.length),
            const SizedBox(
              height: 20,
            ),
            const CommonShowCode(
              codeText: CodeText.internalDrawerCode,
            )
          ],
        ),
      ),
    );
  }
}