import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing/utils/code_text.dart';
import 'package:testing/utils/common_button.dart';

import '../../utils/common_widget_classes.dart';
import '../../utils/constants.dart';

class CustomHalfSpinner extends StatefulWidget {
  const CustomHalfSpinner({super.key});

  @override
  State<CustomHalfSpinner> createState() => _CustomHalfSpinnerState();
}

class _CustomHalfSpinnerState extends State<CustomHalfSpinner>
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
  double scaleSpinner = 2.0;
  ui.Image? image;
  ImageInfo? imageInfo;
  List<ui.Image> images = [];
  List<ImageInfo> imageInfoArray = [];

  late AnimationController _rotateAlongZAxisAnimationController;
  late Animation _rotateAlongZAxisAnimation;

  var sunImage = const NetworkImage(
    "https://kindly-images-stage.azureedge.net/Amount15.png?upscale=false&width=200",
  );

  @override
  void initState() {
    getUrlImage();

    for (int i = 0; i < values.length; i++) {
      colors.add(Color(0xffdbf4ee));
      // colors.add(getRandomColor());
      // if(image != null){
      //   images.add(image!);
      // }
      // if(imageInfo != null){
      //   imageInfoArray.add(imageInfo!);
      // }
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
    setState(() {});
    super.initState();
  }

  getUrlImage() async {
    debugPrint('haalo');

    final ImageStream stream = sunImage.resolve(const ImageConfiguration());

    // Add listener to the image stream
    stream.addListener(
      ImageStreamListener((ImageInfo info, bool synchronousCall) {
        setState(() {
          imageInfo = info;
          imageInfoArray.add(info);
        });
        debugPrint('lskjdlfksjd');
      }, onError: (dynamic exception, StackTrace? stackTrace) {
        print('Error loading image: $exception');
      }),
    );

    // String imageUrl = "https://kindly-images-stage.azureedge.net/Amount15.png?upscale=false&width=200";
    // Uint8List bytes = (await NetworkAssetBundle(Uri.parse(imageUrl))
    //     .load(imageUrl))
    //     .buffer
    //     .asUint8List();
    //
    // image = await decodeImageFromList(bytes.buffer.asUint8List());
    // setState(() {});
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
        randomAngle = startAngle;
        // randomAngle = startAngle + (angleDifference / 2);
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
    // setState(() {
    //   selectedAngle = randomAngle;
    // });
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
        backgroundColor: Colors.white,
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
                                    child: Transform.scale(
                                      scale: scaleSpinner,
                                      child: Stack(
                                        children: [
                                          CustomPaint(
                                            painter: CirclePart(
                                                colors: colors,
                                                values: values,
                                                images: images,
                                                imageInfoArray: imageInfoArray),
                                            child: const SizedBox(
                                              width: 200,
                                              height: 200,
                                            ),
                                          ),
                                        ],
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

                          Transform.scale(
                            scale: scaleSpinner,
                            child: CustomPaint(
                              painter: HideOverflow(),
                              child: const SizedBox(
                                width: 200,
                                height: 200,
                              ),
                            ),
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
  List<ui.Image> images;
  List<ImageInfo> imageInfoArray;
  double positionOfText = 1.3;

  CirclePart({
    required this.colors,
    // required this.sections,
    required this.values,
    required this.images,
    required this.imageInfoArray,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // final sections = 10;

    double theta = 2 * pi / values.length;

    // final path = Path();
    double radius = size.width / 2;
    Offset center = Offset(radius, radius);

    double angleDifference = 2 * pi / values.length;
    double startAngle = 0.0;
    if (startAngle == 0.0) {
      startAngle = angleDifference / 2;
    }
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

      Paint arcBorderPaint = Paint()
        ..color = Colors.white
        // ..color = Colors.primaries[Random().nextInt(Colors.primaries.length)]
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5;

      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startAngle, theta, true, arcBorderPaint);
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startAngle, theta, true, paint);

//----------------------- drawing text ---------------------------------------->
      var textStyleDoller = GoogleFonts.holtwoodOneSc(
        color: Color(0xff2B6153),
        fontSize: 7,
        fontWeight: FontWeight.w400,
      );
      var textStyle = GoogleFonts.holtwoodOneSc(
        color: Color(0xff2B6153),
        fontSize: 10,
        fontWeight: FontWeight.w400,
      );
      TextSpan textSpan = TextSpan(
          text: '\$',
          // text: '${i * 100 / sections}',
          style: textStyleDoller,
          children: [
            TextSpan(
              text:
                  values[i - 1] < 10 ? '${values[i - 1]} ' : '${values[i - 1]}',
              // text: '${i * 100 / sections}',
              style: textStyle,
            )
          ]);
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
      canvas.translate(
          xCenter + (radius / positionOfText) * cos(startAngle + (theta / 2)),
          yCenter +
              ((radius / positionOfText) * (sin(startAngle + (theta / 2)))));
      // canvas.rotate(-(3 * pi / 2));
      // canvas.rotate(-(pi / 2));
      canvas.rotate(startAngle + (theta / 2) + pi / 2);
      // canvas.rotate(theta * (i + 1));
      canvas.translate(-xCenter, -yCenter);

      // text circle
      Paint circlePaint = Paint()..color = Color(0xffB7E9DD);
      canvas.drawCircle(center, 13, circlePaint);

      // adding image
      // if (imageInfoArray[i - 1] != null) {
      // canvas.save();
      // rotate(
      //     canvas: canvas,
      //     cx: image!.width.toDouble() / 2,
      //     cy: image!.height.toDouble() / 2,
      //     angle: -0.3);
      // canvas.scale(size.height / images[i - 1].height);
      // canvas.drawImage(imageInfoArray[i - 1].image, center, circlePaint);
      // canvas.drawImage(
      //     imageInfoArray[i - 1].image, Offset(0 - (imageInfoArray[i - 1].image.width / 2), 0), paint);

      // canvas.restore();
      // }

      textPainter.paint(canvas, delta);
      // adding image
      if (imageInfoArray.isNotEmpty) {
        // canvas.save();
        // rotate(
        //     canvas: canvas,
        //     cx: image!.width.toDouble() / 2,
        //     cy: image!.height.toDouble() / 2,
        //     angle: -0.3);
        canvas.scale(0.4);
        // canvas.drawImage(imageInfoArray[i - 1].image, center, circlePaint);
        canvas.drawImage(imageInfoArray[0].image, center, paint);

        // canvas.restore();
      }
      canvas.restore();
      startAngle += theta;
    }

    debugPrint(imageInfoArray.length.toString());

    //center white circle
    Paint circlePaint = Paint()..color = Colors.white;
    canvas.drawCircle(center, radius / 1.7, circlePaint);
    //center grey border
    Paint circleBorderInsidePaint = Paint()
      ..color = Color(0xffF4F4F4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, radius / 1.8, circleBorderInsidePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
class HideOverflow extends CustomPainter {


  HideOverflow();

  @override
  void paint(Canvas canvas, Size size) {

    Paint rectPaint = Paint()..color = Colors.white..style= PaintingStyle.fill;
    Paint rectPaint2 = Paint()..color = Colors.white..style= PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTWH(-70, -50, size.width, size.width+100), rectPaint);
    canvas.drawRect(Rect.fromLTWH(0, -50, size.width, size.width-100), rectPaint);
    canvas.drawRect(Rect.fromLTWH(0, 150, size.width, size.width-100), rectPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
