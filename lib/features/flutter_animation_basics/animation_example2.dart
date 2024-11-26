import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:testing/utils/code_text.dart';

import '../../utils/common_widget_classes.dart';
import '../../utils/constants.dart';

class AnimationExample2 extends StatefulWidget {
  const AnimationExample2({super.key});

  @override
  State<AnimationExample2> createState() => _AnimationExample2State();
}

class _AnimationExample2State extends State<AnimationExample2> with TickerProviderStateMixin {

  List points = [

  ];

  late AnimationController _rotateAlongZAxisAnimationController;
  late Animation _rotateAlongZAxisAnimation;

  late AnimationController _flipAlongYAxisAnimationController;
  late Animation _flipAlongYAxisAnimation;

  @override
  void initState() {
    _rotateAlongZAxisAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _rotateAlongZAxisAnimation = Tween<double>(begin: 0, end: -(pi/2)).animate(CurvedAnimation(parent: _rotateAlongZAxisAnimationController, curve: Curves.bounceOut));

    _flipAlongYAxisAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1)
    );

    _flipAlongYAxisAnimation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(CurvedAnimation(parent: _flipAlongYAxisAnimationController, curve: Curves.bounceOut));

    _rotateAlongZAxisAnimationController.addStatusListener((status){
      if(status == AnimationStatus.completed){
        _flipAlongYAxisAnimation = Tween<double>(
          begin: _flipAlongYAxisAnimation.value,
          end: _flipAlongYAxisAnimation.value + pi,
        ).animate(CurvedAnimation(parent: _flipAlongYAxisAnimationController, curve: Curves.bounceOut));

        _flipAlongYAxisAnimationController..reset()..forward();
      }
    });

    _flipAlongYAxisAnimationController.addStatusListener((status){
      if(status == AnimationStatus.completed){
        _rotateAlongZAxisAnimation = Tween<double>(begin: _rotateAlongZAxisAnimation.value, end: _rotateAlongZAxisAnimation.value + -(pi/2)).animate(CurvedAnimation(parent: _rotateAlongZAxisAnimationController, curve: Curves.bounceOut));
        _rotateAlongZAxisAnimationController..reset()..forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _rotateAlongZAxisAnimationController.dispose();
    _flipAlongYAxisAnimationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1),(){
      _rotateAlongZAxisAnimationController..reset()..forward();
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Example 2',
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
                    animation: _rotateAlongZAxisAnimation,
                    builder: (context, child){
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateZ(_rotateAlongZAxisAnimation.value),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedBuilder(
                              animation: _flipAlongYAxisAnimation,
                              builder: (context, child){
                                return Transform(
                                  transform: Matrix4.identity()..rotateY(_flipAlongYAxisAnimation.value),
                                  alignment: Alignment.centerRight,
                                  child: ClipPath(
                                    clipper: HalfCircleClipper(side: CircleSide.left),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      color: Colors.blue,
                                    ),
                                  ),
                                );
                              },
                            ),
                            AnimatedBuilder(
                              animation: _flipAlongYAxisAnimation,
                              builder: (context, child){
                                return Transform(
                                  transform: Matrix4.identity()..rotateY(_flipAlongYAxisAnimation.value),
                                  alignment: Alignment.centerLeft,
                                  child: ClipPath(
                                    clipper: HalfCircleClipper(side: CircleSide.right),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            const CommonShowCode(codeText: CodeText.flutterAnimationExample2,),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

enum CircleSide {
  left, right
}

extension ToPath on CircleSide{
  Path toPath(Size size){
    final path = Path();

    late Offset offset;
    late bool clockWise;
    
    switch(this){
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockWise = false;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockWise = true;
    }

    path.arcToPoint(offset, clockwise: clockWise ,radius: Radius.elliptical(size.width/2, size.height/2));
    path.close();

    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path>{

  final CircleSide side;

  HalfCircleClipper({required this.side});


  @override
  getClip(Size size) {
    return side.toPath(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;

}
