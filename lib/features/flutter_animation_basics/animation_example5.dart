import 'dart:math' show pi, cos, sin;

import 'package:flutter/material.dart';
import 'package:testing/utils/code_text.dart';

import '../../utils/common_widget_classes.dart';
import '../../utils/constants.dart';

class AnimationExample5 extends StatefulWidget {
  const AnimationExample5({super.key});

  @override
  State<AnimationExample5> createState() => _AnimationExample5State();
}

class _AnimationExample5State extends State<AnimationExample5>
    with TickerProviderStateMixin {
  List points = ["Custom painter to draw hexagonal with incresing sides."];
  late AnimationController _sidesAnimationController;
  late Animation _sidesAnimation;

  late AnimationController _radiusController;
  late Animation _radiusAnimation;

  late AnimationController _rotationController;
  late Animation _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _sidesAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _sidesAnimation = IntTween(
      begin: 3,
      end: 10,
    ).animate(_sidesAnimationController);

    _radiusController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _radiusAnimation = Tween(
      begin: 20.0,
      end: 200.0,
    )
        .chain(
          CurveTween(curve: Curves.bounceInOut),
        )
        .animate(_radiusController);

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _rotationAnimation = Tween(
      begin: 0.0,
      end: 2 * pi,
    )
        .chain(
          CurveTween(curve: Curves.easeInOut),
        )
        .animate(_rotationController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sidesAnimationController.repeat(reverse: true);
    _radiusController.repeat(reverse: true);
    _rotationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _sidesAnimationController.dispose();
    _radiusController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Example 5',
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
              itemCount: points.length,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: AnimatedBuilder(
                  animation: Listenable.merge([
                    _sidesAnimationController,
                    _radiusController,
                    _rotationController
                  ]),
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..rotateX(_rotationAnimation.value)
                        ..rotateY(_rotationAnimation.value)
                        ..rotateZ(_rotationAnimation.value),
                      child: CustomPaint(
                        painter: Polygon(sides: _sidesAnimation.value),
                        child: SizedBox(
                          width: _radiusAnimation.value,
                          height: _radiusAnimation.value,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const CommonShowCode(
              codeText: CodeText.flutterAnimationExample5,
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

class Polygon extends CustomPainter {
  final int sides;

  Polygon({
    super.repaint,
    required this.sides,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    final path = Path();

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2;
    double angle = (2 * pi) / sides;
    List angles = List.generate(sides, (i) => i * angle);

    path.moveTo(
      center.dx + radius * cos(0),
      center.dy + radius * sin(0),
    );

    for (angle in angles) {
      path.lineTo(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate is Polygon && oldDelegate.sides != sides;
}
