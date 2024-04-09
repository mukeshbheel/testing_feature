import 'package:flutter/material.dart';

class CustomPaintingWidgets extends StatelessWidget {
  const CustomPaintingWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 50,),
                const Text('Line Painting'),
                const SizedBox(height: 10,),
                CustomPaint(
                  foregroundPainter: LinePainter(),
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                const Text('Circle Painting'),
                const SizedBox(height: 10,),
                CustomPaint(
                  foregroundPainter: CiclePainter(),
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var linearBrush = Paint()
        ..color = Colors.green
        ..strokeWidth = 20;

    Offset start = Offset(10, size.height/2);
    Offset end = Offset(size.width-10, size.height/2);

    canvas.drawLine(start, end, linearBrush);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
  
}
class CiclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var circleBrush = Paint()
        ..color = Colors.red
        ..strokeWidth = 10;
    Offset midPointOfCircle = Offset(size.width/2, size.height/2);

    canvas.drawCircle(midPointOfCircle, size.height/4, circleBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}
