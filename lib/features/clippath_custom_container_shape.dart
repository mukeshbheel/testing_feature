import 'package:flutter/material.dart';

import '../utils/code_text.dart';
import '../utils/common_widget_classes.dart';
import '../utils/constants.dart';

class ClippathCustomContainerShape extends StatelessWidget {
  const ClippathCustomContainerShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'ClipPath Custom Container',
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0xff626DFB),
                    ),
                    ClipPath(
                      clipper: SimpleClipper1(),
                      child: Container(
                        color: Colors.white,
                        height: 400,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 50),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                  color: const Color(0xff626DFB),
                                  borderRadius: BorderRadius.circular(10)),
                              // height: 50,
                              child: Text(
                                "Corner Clipper",
                                style: googleFontStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 200,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // ------------------------------wave ------------------>
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blue,
                    ),
                    ClipPath(
                      clipper: WaveClipper(),
                      child: Container(
                        color: Colors.white,
                        height: 500,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              // height: 50,
                              child: Text(
                                "Wave Clipper",
                                style: googleFontStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 200,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // ------------------------------zigzag ------------------>
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0xff531108),
                    ),
                    ClipPath(
                      clipper: ZigZagClipper(
                          peaks: 10, verticalDepth: 20, verticalHeight: 300),
                      child: Container(
                        color: Colors.white,
                        height: 500,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                  color: const Color(0xff531108),
                                  borderRadius: BorderRadius.circular(10)),
                              // height: 50,
                              child: Text(
                                "Zig-Zag Clipper",
                                style: googleFontStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 100,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              const CommonShowCode(
                codeText: CodeText.clipPathCustomContainerCode,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();

    path.lineTo(0, size.height - 60);

    var start = Offset(size.width / 2, size.height);
    var end = Offset(size.width, size.height - 180);
    path.quadraticBezierTo(start.dx, start.dy, end.dx, end.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height / 2);

    Offset firstStart = Offset(size.width / 6, size.height / 2 + 80);
    Offset firstEnd = Offset(size.width / 3, size.height / 2);

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    Offset secondStart = Offset(size.width / 2, size.height / 2 - 80);
    Offset secondEnd = Offset(size.width - size.width / 3, size.height / 2);
    //
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    //
    Offset thirdStart =
        Offset(size.width - size.width / 6, size.height / 2 + 80);
    Offset thirdEnd = Offset(size.width, size.height / 2);

    path.quadraticBezierTo(
        thirdStart.dx, thirdStart.dy, thirdEnd.dx, thirdEnd.dy);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class ZigZagClipper extends CustomClipper<Path> {
  ZigZagClipper({
    this.peaks = 5,
    this.verticalDepth = 20,
    this.verticalHeight,
  });

  int peaks;
  double verticalDepth;
  double? verticalHeight;

  @override
  Path getClip(Size size) {
    var path = Path();
    double totalSection = peaks * 2;
    double sectionWidth = size.width / totalSection;
    double startHeight = verticalHeight ?? size.height / 4;

    path.lineTo(0, startHeight);
    for (var i = 0; i <= totalSection; i++) {
      if (i % 2 == 0) {
        path.lineTo(sectionWidth * i, startHeight + verticalDepth);
      } else {
        path.lineTo(sectionWidth * i, startHeight);
      }
    }
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
