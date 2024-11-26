import 'dart:isolate';
import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing/utils/code_text.dart';
import 'package:testing/utils/common_button.dart';
import 'package:testing/utils/common_snackbar.dart';

import '../../utils/common_widget_classes.dart';
import '../../utils/constants.dart';

class AnimationExample1 extends StatefulWidget {
  const AnimationExample1({super.key});

  @override
  State<AnimationExample1> createState() => _AnimationExample1State();
}

class _AnimationExample1State extends State<AnimationExample1> with SingleTickerProviderStateMixin {

  late AnimationController _controllerRotateAxis;
  late Animation _animationRotateAxis;

  @override
  void initState() {
    _controllerRotateAxis = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2)
    );

    _animationRotateAxis = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controllerRotateAxis);

    _controllerRotateAxis.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controllerRotateAxis.dispose();
    super.dispose();
  }

  List points = [
    "Flutter canvas starts for top left corner. Positive Y axis goes downwards.",
    "Flutter angles are calculated clockwise positively.",
    "pi = 180 degree",
    "AnimationController vsync : this, using mixins SingleTickerProviderStateMixin binds the animation with the current screen or widget refresh rate.",
    "Tween animation is used to give a range of value with begin and end. tween = between",
    "AnimatedBuilder listens for value change in animation and calling the builder again to show the changes of the animation controller and animation."
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Example 1',
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
                child: RepaintBoundary(
                  child: AnimatedBuilder(
                    animation: _controllerRotateAxis,
                    builder: (context, child){
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateY(_animationRotateAxis.value),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black87,
                                    blurRadius: 7,
                                    spreadRadius: 6,
                                    offset: Offset(2,2)
                                )
                              ]
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            const CommonShowCode(codeText: CodeText.flutterAnimationExample1,),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
