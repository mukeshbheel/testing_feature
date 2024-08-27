import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:testing/utils/code_text.dart';

import '../../utils/common_widget_classes.dart';
import '../../utils/constants.dart';

class AnimationExample4 extends StatefulWidget {
  const AnimationExample4({super.key});

  @override
  State<AnimationExample4> createState() => _AnimationExample4State();
}

class _AnimationExample4State extends State<AnimationExample4> {

  List points = [
    "Create custom clipper extending CustomClipper class.",
    "Create Rectangle from Circle = Rect.fromCircle() function.",
    "Create Oval path providing the rectangle = path.addOval()",
    "Use TweenAnimationBuilder for the color change animation with a ColorTween that takes begin and end colors."
  ];
  Color _color = getRandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Example 4',
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
                child: ClipPath(
                  clipper: CircleClipper(),
                  child: TweenAnimationBuilder(
                    tween: ColorTween(
                      begin: _color,
                      end: getRandomColor(),
                    ),
                    duration: const Duration(milliseconds: 370),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                    builder: (context, color, child){
                      return ColorFiltered(colorFilter: ColorFilter.mode(color!, BlendMode.srcATop),child: child,);
                    },
                    onEnd: (){
                      setState(() {
                        _color = getRandomColor();
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            const CommonShowCode(codeText: CodeText.flutterAnimationExample4,),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Rect rect = Rect.fromCircle(center: Offset(size.width/2, size.height/2), radius: size.width/2);

    Path path = Path();
    path.addOval(rect);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
