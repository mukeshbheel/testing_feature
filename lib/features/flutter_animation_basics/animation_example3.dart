import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:testing/utils/code_text.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

import '../../utils/common_widget_classes.dart';
import '../../utils/constants.dart';

class AnimationExample3 extends StatefulWidget {
  const AnimationExample3({super.key});

  @override
  State<AnimationExample3> createState() => _AnimationExample3State();
}

class _AnimationExample3State extends State<AnimationExample3> with TickerProviderStateMixin {

  late AnimationController _xAxisController;
  late AnimationController _yAxisController;
  late AnimationController _zAxisController;
  late Tween<double> _animation;

  @override
  void initState() {
    super.initState();
    _xAxisController = AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _yAxisController = AnimationController(vsync: this, duration: const Duration(seconds: 30));
    _zAxisController = AnimationController(vsync: this, duration: const Duration(seconds: 40));
    _animation = Tween<double>(
      begin: 0,
      end: 2*pi,
    );
  }

  @override
  void dispose() {
    _xAxisController.dispose();
    _yAxisController.dispose();
    _zAxisController.dispose();
    super.dispose();
  }

  List points = [];


  @override
  Widget build(BuildContext context) {
    _xAxisController..reset()..repeat();
    _yAxisController..reset()..repeat();
    _zAxisController..reset()..repeat();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Example 3',
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
                child: AnimatedBuilder(
                  animation: Listenable.merge([
                    _xAxisController,
                    _yAxisController,
                    _zAxisController,
                  ]),
                  builder: (context, child){
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..rotateX(_animation.evaluate(_xAxisController))
                      ..rotateY(_animation.evaluate(_yAxisController))
                      ..rotateZ(_animation.evaluate(_zAxisController)),
                      child: Stack(
                        children: [

                          //back
                          Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..translate(Vector3(0.0, 0.0, -100.0)),
                            child: container(),
                          ),

                          //left
                          Transform(
                            alignment: Alignment.centerLeft,
                            transform: Matrix4.identity()..rotateY(pi/2),
                            child: container(),
                          ),

                          //right
                          Transform(
                            alignment: Alignment.centerRight,
                            transform: Matrix4.identity()..rotateY(-pi/2),
                            child: container(),
                          ),

                          //top
                          Transform(
                            alignment: Alignment.topCenter,
                            transform: Matrix4.identity()..rotateX(-pi/2),
                            child: container(),
                          ),

                          //bottom
                          Transform(
                            alignment: Alignment.bottomCenter,
                            transform: Matrix4.identity()..rotateX(pi/2),
                            child: container(),
                          ),
                          
                          //front
                          container(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 30,),
            const CommonShowCode(codeText: CodeText.flutterAnimationExample3,),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}


Container container()=>Container(
  decoration: BoxDecoration(
      border: Border.all(color: Colors.red, width: 2)
  ),
  width: 100,
  height: 100,
);
