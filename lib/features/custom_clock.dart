import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' show min, pi, cos, sin;
import '../utils/code_text.dart';
import '../utils/common_widget_classes.dart';
import '../utils/constants.dart';

class CustomClock extends StatelessWidget {
  CustomClock({super.key});
  List points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Custom Clock',
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
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [CustomClockWidget(size: Size(200, 200))],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const CommonShowCode(
              codeText: CodeText.customClockCode,
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

class CustomClockWidget extends StatefulWidget {
  const CustomClockWidget({super.key, required this.size});
  final Size size;

  @override
  State<CustomClockWidget> createState() => _CustomClockWidgetState();
}

class _CustomClockWidgetState extends State<CustomClockWidget> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 2,
      child: RepaintBoundary(
        child: CustomPaint(
          painter: ClockPainter(),
          child: const SizedBox(
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final DateTime dateTime = DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.width / 2;
    Offset center = Offset(centerX, centerY);
    final radius = min(size.width, size.height) / 2;

    Paint innerCirclePaint = Paint()..color = const Color(0xff3E406A);
    Paint circleRingPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.07;
    Paint circleCenterPaint = Paint()..color = Colors.white;

//-----------------minute------------------------------------>
    Color minColor1 = const Color(0xffD46CC0);
    Color minColor2 = const Color(0xffF8E1FF);
    double minLength = radius * 0.4;
    double secLength = radius * 0.5;
    double hrLength = radius * 0.3;
    Paint minPaint = Paint()
      ..shader = RadialGradient(colors: [minColor1, minColor2])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = radius * 0.05
      ..strokeCap = StrokeCap.round;

    final minOffsetX =
        centerX + minLength * cos((dateTime.minute * 6) * pi / 180);
    final minOffsetY =
        centerY + minLength * sin((dateTime.minute * 6) * pi / 180);
    Offset minOffset = Offset(minOffsetX, minOffsetY);

    //-----------------sec------------------------------------>
    Color secColor1 = const Color(0xfff2b009);
    Color secColor2 = const Color.fromARGB(255, 244, 239, 235);
    Paint secPaint = Paint()
      ..shader = RadialGradient(colors: [secColor1, secColor2])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = radius * 0.03
      ..strokeCap = StrokeCap.round;

    final secOffsetX =
        centerX + secLength * cos((dateTime.second * 6) * pi / 180);
    final secOffsetY =
        centerY + secLength * sin((dateTime.second * 6) * pi / 180);
    Offset secOffset = Offset(secOffsetX, secOffsetY);

    //-----------------hr------------------------------------>
    Color hrColor1 = const Color.fromARGB(255, 64, 134, 247);
    Color hrColor2 = const Color.fromARGB(255, 1, 34, 125);
    Paint hrPaint = Paint()
      ..shader = RadialGradient(colors: [hrColor1, hrColor2])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = radius * 0.05
      ..strokeCap = StrokeCap.round;

    final hrOffsetX = centerX +
        hrLength * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    final hrOffsetY = centerY +
        hrLength * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    Offset hrOffset = Offset(hrOffsetX, hrOffsetY);

    //------------------outer dashes------------------------->
    double outerCircleDashRadius = radius;
    double innerCircleDashRadius = radius * 0.95;
    Color dashColor1 = const Color.fromARGB(255, 232, 233, 235);
    Color dashColor2 = const Color.fromARGB(255, 119, 120, 124);
    Paint dashPaint = Paint()
      ..shader = RadialGradient(colors: [dashColor1, dashColor2])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = radius * 0.02
      ..strokeCap = StrokeCap.round;
    for (int i = 0; i < 360; i += 6) {
      bool isHr = i % 30 == 0;
      Offset outerDashOffset = Offset(
        centerX + outerCircleDashRadius * cos(i * pi / 180),
        centerY + outerCircleDashRadius * sin(i * pi / 180),
      );
      Offset innerDashOffset = Offset(
        centerX +
            (isHr ? radius * 0.92 : innerCircleDashRadius) * cos(i * pi / 180),
        centerY +
            (isHr ? radius * 0.92 : innerCircleDashRadius) * sin(i * pi / 180),
      );
      canvas.drawLine(outerDashOffset, innerDashOffset, dashPaint);
    }
    canvas.drawCircle(center, radius * 0.65, circleRingPaint);
    canvas.drawCircle(center, radius * 0.65, innerCirclePaint);

    canvas.drawLine(center, secOffset, secPaint);
    canvas.drawLine(center, minOffset, minPaint);
    canvas.drawLine(center, hrOffset, hrPaint);
    canvas.drawCircle(center, radius * 0.09, circleCenterPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
