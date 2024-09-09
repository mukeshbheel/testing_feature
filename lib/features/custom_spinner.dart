import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:testing/utils/code_text.dart';
import 'package:testing/utils/common_button.dart';

import '../../utils/common_widget_classes.dart';
import '../../utils/constants.dart';

class CustomSpinner extends StatefulWidget {
  const CustomSpinner({super.key});

  @override
  State<CustomSpinner> createState() => _CustomSpinnerState();
}

class _CustomSpinnerState extends State<CustomSpinner>
    with TickerProviderStateMixin {
  List points = [];
  List<Color> colors = [];
  int numberOfSections = 10;
  double rotateAngle = pi / Random().nextInt(180);

  late AnimationController _rotateAlongZAxisAnimationController;
  late Animation _rotateAlongZAxisAnimation;

  resetRotateAngle() {
    setState(() {
      // rotateAngle += 2 * pi + 5 * (pi / Random().nextInt(180));
    });
  }

  @override
  void initState() {
    for (int i = 0; i < numberOfSections; i++) {
      colors.add(getRandomColor());
    }
    _rotateAlongZAxisAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _rotateAlongZAxisAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(
        CurvedAnimation(
            parent: _rotateAlongZAxisAnimationController,
            curve: Curves.easeInOut));
    super.initState();
  }

  @override
  void dispose() {
    _rotateAlongZAxisAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 1), () {
    //   _rotateAlongZAxisAnimationController
    //     ..reset()
    //     ..forward();
    // });
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
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width,
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (false)
                      AnimatedContainer(
                        duration: Duration(seconds: 3),
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..rotateZ(rotateAngle),
                          child: CustomPaint(
                            painter: CirclePart(
                              colors: colors,
                              sections: numberOfSections,
                            ),
                            child: const SizedBox(
                              width: 200,
                              height: 200,
                            ),
                          ),
                        ),
                      ),
                    AnimatedBuilder(
                      animation: _rotateAlongZAxisAnimationController,
                      builder: (context, child) {
                        return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..rotateZ(_rotateAlongZAxisAnimation.value),
                          child: CustomPaint(
                            painter: CirclePart(
                              colors: colors,
                              sections: numberOfSections,
                            ),
                            child: const SizedBox(
                              width: 200,
                              height: 200,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 200,
                      child: CommonButton.mainButton(
                          text: "Spin The Wheel",
                          onTap: () {
                            resetRotateAngle();
                            _rotateAlongZAxisAnimationController.reset();
                            _rotateAlongZAxisAnimationController.forward();
                          }),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const CommonShowCode(
              codeText: CodeText.flutterAnimationExample2,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class CirclePart extends CustomPainter {
  List<Color> colors;
  int sections;

  CirclePart({
    required this.colors,
    required this.sections,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // final sections = 10;

    double theta = 2 * pi / sections;

    // final path = Path();
    double radius = size.width / 2;
    Offset center = Offset(radius, radius);

    double startAngle = 0.0;
    double endAngle = theta;
    // Color color = getRandomColor();
    for (int i = 1; i <= sections; i++) {
      debugPrint("state angle : $startAngle");
      debugPrint("end angle : $endAngle");
      Paint paint = Paint()
        ..color = colors[i - 1]
        // ..color = Colors.primaries[Random().nextInt(Colors.primaries.length)]
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.fill
        ..strokeWidth = 2;

      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startAngle, theta, true, paint);

// drawing text
      const textStyle = TextStyle(
        color: Colors.white,
        fontSize: 12,
      );
      TextSpan textSpan = TextSpan(
        text: '${i * 100 / sections}',
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );
      final xCenter = (size.width) / 2;
      final yCenter = (size.height) / 2;
      final offset = Offset(xCenter, yCenter);
      // textPainter.paint(canvas, offset);

      final delta = Offset(xCenter - textPainter.size.width / 2,
          yCenter - textPainter.size.height / 2);

      // Rotate the text about textCentrePoint
      canvas.save();
      canvas.translate(xCenter + (radius / 1.5) * cos(startAngle + (theta / 2)),
          yCenter + ((radius / 1.5) * (sin(startAngle + (theta / 2)))));
      // canvas.rotate(theta * (i + 1));
      canvas.translate(-xCenter, -yCenter);
      textPainter.paint(canvas, delta);
      canvas.restore();
      startAngle += theta;
      Color color = getRandomColor();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
