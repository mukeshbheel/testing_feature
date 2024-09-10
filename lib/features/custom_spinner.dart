import 'dart:math';
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
  List points = [
    "create single custom painter sending values in it.",
    "canvas.drawarc and text painter for creating arcs using for loop."
  ];
  List<Color> colors = [];
  int numberOfSections = 10;
  double numberOfRotations = 10;
  double selectedAngle = 2 * pi;
  int selectedValue = 0;
  int currency = 0;
  List values = [5, 20, 1, 87, 55, 12, 98, 43, 89, 12];

  late AnimationController _rotateAlongZAxisAnimationController;
  late Animation _rotateAlongZAxisAnimation;

  @override
  void initState() {
    for (int i = 0; i < values.length; i++) {
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

    _rotateAlongZAxisAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          currency += selectedValue;
        });
      }
    });
    super.initState();
  }

  rotateWheel() {
    double randomAngle = 2 * pi * Random().nextDouble();

    double angleDifference = 2 * pi / numberOfSections;
    double startAngle = 0.0;
    for (int i = 0; i < numberOfSections; i++) {
      if (startAngle <= randomAngle &&
          randomAngle <= (startAngle + angleDifference)) {
        setState(() {
          selectedValue = values[numberOfSections - i - 1];
        });
        randomAngle = startAngle + (angleDifference / 2);
        break;
      } else {
        startAngle += angleDifference;
      }
    }
    _rotateAlongZAxisAnimation =
        Tween<double>(begin: 0, end: numberOfRotations * 2 * pi + randomAngle)
            .animate(CurvedAnimation(
                parent: _rotateAlongZAxisAnimationController,
                curve: Curves.easeInOutCubicEmphasized));
    _rotateAlongZAxisAnimationController.reset();
    _rotateAlongZAxisAnimationController.forward();
    setState(() {
      selectedAngle = randomAngle;
    });
  }

  @override
  void dispose() {
    _rotateAlongZAxisAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Spinner',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.currency_rupee_outlined,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "$currency",
                          style: googleFontStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Transform.rotate(
                      angle: -pi / 2,
                      child: Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedBuilder(
                                animation: _rotateAlongZAxisAnimationController,
                                builder: (context, child) {
                                  return Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.identity()
                                      ..rotateZ(
                                          _rotateAlongZAxisAnimation.value),
                                    child: CustomPaint(
                                      painter: CirclePart(
                                        colors: colors,
                                        values: values,
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
                                width: 20,
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 0,
                            top: 0,
                            right: 0,
                            child: Transform.flip(
                              flipX: true,
                              child: const Icon(
                                Icons.play_arrow,
                                color: Color.fromARGB(255, 232, 183, 183),
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 200,
                      child: CommonButton.mainButton(
                          text: "Spin The Wheel",
                          onTap: () {
                            rotateWheel();
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
              codeText: CodeText.spinnerCode,
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
  // int sections;
  List values;

  CirclePart({
    required this.colors,
    // required this.sections,
    required this.values,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // final sections = 10;

    double theta = 2 * pi / values.length;

    // final path = Path();
    double radius = size.width / 2;
    Offset center = Offset(radius, radius);

    double startAngle = 0.0;
    double endAngle = theta;
    // Color color = getRandomColor();
    for (int i = 1; i <= values.length; i++) {
      debugPrint("state angle : $startAngle");
      debugPrint("end angle : $endAngle");
      Paint paint = Paint()
        ..color = colors[i - 1]
        // ..color = Colors.primaries[Random().nextInt(Colors.primaries.length)]
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.fill
        ..strokeWidth = 1;

      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startAngle, theta, true, paint);

//----------------------- drawing text ---------------------------------------->
      const textStyle = TextStyle(
        color: Colors.white,
        fontSize: 12,
      );
      TextSpan textSpan = TextSpan(
        text: '${values[i - 1]}',
        // text: '${i * 100 / sections}',
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

      final delta = Offset(xCenter - textPainter.size.width / 2,
          yCenter - textPainter.size.height / 2);

      // Rotate the text about textCentrePoint
      canvas.save();
      canvas.translate(xCenter + (radius / 1.5) * cos(startAngle + (theta / 2)),
          yCenter + ((radius / 1.5) * (sin(startAngle + (theta / 2)))));
      canvas.rotate(-(3 * pi / 2));
      // canvas.rotate(theta * (i + 1));
      canvas.translate(-xCenter, -yCenter);
      textPainter.paint(canvas, delta);
      canvas.restore();
      startAngle += theta;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
