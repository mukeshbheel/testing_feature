class CodeText {
  static const String accordianCode = '''
  import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/utils/constants.dart';

import '../utils/code_text.dart';
import '../utils/common_widget_classes.dart';

/// Main example page
class AccordionPage extends StatelessWidget //__
{
  static const headerStyle = TextStyle(
      color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold);
  static const contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  static const loremIpsum =
      "Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.";
  static const slogan =
      'Do not forget to play around with all sorts of colors, backgrounds, borders, etc.';

  const AccordionPage({super.key});

  @override
  build(context) => Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Accordion',
            style: googleFontStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Accordion(
                headerBorderColor: Colors.blueGrey,
                headerBorderColorOpened: Colors.transparent,
                // headerBorderWidth: 1,
                headerBackgroundColorOpened: Colors.green,
                contentBackgroundColor: Colors.white,
                contentBorderColor: Colors.green,
                contentBorderWidth: 3,
                contentHorizontalPadding: 20,
                scaleWhenAnimating: true,
                openAndCloseAnimation: true,
                headerPadding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                sectionClosingHapticFeedback: SectionHapticFeedback.light,
                children: [
                  AccordionSection(
                    isOpen: true,
                    leftIcon: const Icon(Icons.input, color: Colors.white),
                    header: const Text('Profile details', style: headerStyle),
                    contentHorizontalPadding: 40,
                    contentVerticalPadding: 20,
                    content: const MyInputForm(),
                  ),
                  AccordionSection(
                    isOpen: true,
                    leftIcon: const Icon(Icons.input, color: Colors.white),
                    header: const Text('other details', style: headerStyle),
                    contentHorizontalPadding: 40,
                    contentVerticalPadding: 20,
                    content: const MyInputForm(),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CommonShowCode(
                codeText: CodeText.accordianCode,
              )
            ],
          ),
        ),
      );
} //__

class MyInputForm extends StatelessWidget //__
{
  const MyInputForm({super.key});

  @override
  Widget build(context) //__
  {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            label: const Text('Some text goes here ...'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ).marginOnly(bottom: 10),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Submit'),
        )
      ],
    );
  }
}

class MyDataTable extends StatelessWidget //__
{
  const MyDataTable({super.key});

  @override
  Widget build(context) //__
  {
    return DataTable(
      sortAscending: true,
      sortColumnIndex: 1,
      showBottomBorder: false,
      columns: const [
        DataColumn(
            label: Text('ID', style: AccordionPage.contentStyleHeader),
            numeric: true),
        DataColumn(
            label:
                Text('Description', style: AccordionPage.contentStyleHeader)),
        DataColumn(
            label: Text('Price', style: AccordionPage.contentStyleHeader),
            numeric: true),
      ],
      rows: const [
        DataRow(
          cells: [
            DataCell(Text('1',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right)),
            DataCell(Text('Fancy Product', style: AccordionPage.contentStyle)),
            DataCell(Text(r'\$ 199.99',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('2',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right)),
            DataCell(
                Text('Another Product', style: AccordionPage.contentStyle)),
            DataCell(Text(r'\$ 79.00',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('3',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right)),
            DataCell(
                Text('Really Cool Stuff', style: AccordionPage.contentStyle)),
            DataCell(Text(r'\$ 9.99',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('4',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right)),
            DataCell(Text('Last Product goes here',
                style: AccordionPage.contentStyle)),
            DataCell(Text(r'\$ 19.99',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
      ],
    );
  }
}

class MyNestedAccordion extends StatelessWidget //__
{
  const MyNestedAccordion({super.key});

  @override
  Widget build(context) //__
  {
    return Accordion(
      paddingListTop: 0,
      paddingListBottom: 0,
      maxOpenSections: 1,
      headerBackgroundColorOpened: Colors.black54,
      headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      children: [
        AccordionSection(
          isOpen: true,
          leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
          headerBackgroundColor: Colors.black38,
          headerBackgroundColorOpened: Colors.black54,
          header:
              const Text('Nested Section #1', style: AccordionPage.headerStyle),
          content: const Text(AccordionPage.loremIpsum,
              style: AccordionPage.contentStyle),
          contentHorizontalPadding: 20,
          contentBorderColor: Colors.black54,
        ),
        AccordionSection(
          isOpen: true,
          leftIcon: const Icon(Icons.compare_rounded, color: Colors.white),
          header:
              const Text('Nested Section #2', style: AccordionPage.headerStyle),
          headerBackgroundColor: Colors.black38,
          headerBackgroundColorOpened: Colors.black54,
          contentBorderColor: Colors.black54,
          content: const Row(
            children: [
              Icon(Icons.compare_rounded,
                  size: 120, color: Colors.orangeAccent),
              Flexible(
                  flex: 1,
                  child: Text(AccordionPage.loremIpsum,
                      style: AccordionPage.contentStyle)),
            ],
          ),
        ),
      ],
    );
  }
}  
  ''';
  static const String mappleCode = '''
  import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mappls_gl/mappls_gl.dart';

import '../utils/code_text.dart';
import '../utils/common_widget_classes.dart';
import '../utils/constants.dart';

class MapplesFunction extends StatefulWidget {
  const MapplesFunction({super.key});

  @override
  State<MapplesFunction> createState() => _MapplesFunctionState();
}

class _MapplesFunctionState extends State<MapplesFunction> {
  MapplsMapController? mapController;

  @override
  void initState() {
    // TODO: implement initState
    MapplsAccountManager.setMapSDKKey(mapIAccessToken);
    MapplsAccountManager.setRestAPIKey(mapIRestApiKey);
    MapplsAccountManager.setAtlasClientId(mapIAtlasClientId);
    MapplsAccountManager.setAtlasClientSecret(mapIAtlasClientSecret);
    setPermission();
    super.initState();
  }

  void setPermission() async {
    final location = Location();
    final hasPermissions = await location.hasPermission();
    if (hasPermissions != PermissionStatus.granted) {
      await location.requestPermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Mapple',
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: MapplsMap(
                compassEnabled: true,
                myLocationEnabled: true,
                myLocationTrackingMode: MyLocationTrackingMode.NoneCompass,
                onUserLocationUpdated: (location) => {
                  print(
                      "Position: \${location.position.toString()}, Speed: \${location.speed}, Altitude: \${location.altitude}")
                },
                initialCameraPosition: const CameraPosition(
                  target: LatLng(20.5937, 78.9629),
                  zoom: 7.0,
                ),
                onMapCreated: (MapplsMapController map) {
                  log('map : ' + map.toString());
                  setState(() {
                    mapController = map;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CommonShowCode(
              codeText: CodeText.mappleCode,
            )
          ],
        ),
      ),
    ));
  }
}

  ''';
  static const String flChartsCode = '''
  import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../utils/code_text.dart';
import '../utils/common_widget_classes.dart';
import '../utils/constants.dart';

class FlCharts extends StatefulWidget {
  const FlCharts({super.key});

  @override
  State<FlCharts> createState() => _FlChartsState();
}

class _FlChartsState extends State<FlCharts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Fl Charts',
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 300,
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: const LineChartSample2(),
            ),
            const SizedBox(
              height: 20,
            ),
            const CommonShowCode(
              codeText: CodeText.flChartsCode,
            )
          ],
        ),
      ),
    ));
  }
}

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [Colors.red, Colors.red];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              showAvg ? avgData() : mainData(),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                fontSize: 12,
                color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.w400, fontSize: 10, color: Color(0xffAEAEAE));
    Widget text;
    debugPrint(value.toInt().toString());
    if (value.toInt() % 10 == 0) {
      text = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('\${value.toInt()}', style: style),
          const Text('Km', style: style),
        ],
      );
    } else {
      text = const Text('', style: style);
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.w400, fontSize: 10, color: Color(0xffAEAEAE));
    String text;
    if ([0, 50, 100, 120, 140].contains(value.toInt())) {
      if (value.toInt() > 120) {
        text = '120+ km/h';
      } else {
        text = '\${value.toInt()} km/h';
      }
    } else {
      return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 10,
        drawHorizontalLine: false,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            dashArray: [8, 8],
            color: Color(0xffE4EAF0),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 50,
            interval: 10,
            // getTitlesWidget: (value , TitleMeta meta){
            //   return Text('\$value');
            // },
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 10,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 60,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: const Border(
              left: BorderSide(color: Color(0xffE4EAF0)),
              bottom: BorderSide(color: Color(0xffE4EAF0)))),
      minX: 10,
      maxX: 80,
      minY: 0,
      maxY: 140,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(10, 100),
            FlSpot(18, 110.8),
            FlSpot(28, 80),
            FlSpot(47, 112),
            FlSpot(58, 85),
            FlSpot(70, 114),
            FlSpot(80, 105),
          ],
          isCurved: true,
          color: Colors.red,
          // gradient: LinearGradient(
          //   colors: gradientColors,
          // ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.transparent,
            // gradient: LinearGradient(
            //   colors: gradientColors
            //       .map((color) => color.withOpacity(0.3))
            //       .toList(),
            // ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

  ''';
  static const String overShadowCode = '''
  import 'package:flutter/material.dart';

import '../utils/code_text.dart';
import '../utils/common_widget_classes.dart';
import '../utils/constants.dart';

class OvalShadow extends StatelessWidget {
  const OvalShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Oval Shadow',
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Container with oval radius',
                style:
                    googleFontStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 320,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      width: 300,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 3,
                              blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.vertical(
                            top: Radius.elliptical(
                                MediaQuery.of(context).size.width, 100.0)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      color: Colors.white,
                      width: 500,
                      height: 50,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CommonShowCode(
                codeText: CodeText.overShadowCode,
              )
            ],
          ),
        ),
      ),
    );
  }
}

  ''';
  static const String customPaintingWidgetsCode = '''
  import 'package:flutter/material.dart';

import '../utils/code_text.dart';
import '../utils/common_widget_classes.dart';
import '../utils/constants.dart';

class CustomPaintingWidgets extends StatelessWidget {
  const CustomPaintingWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Custom Painting Widgets',
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'Line Painting',
                style: googleFontStyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomPaint(
                foregroundPainter: LinePainter(),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Circle Painting',
                style: googleFontStyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomPaint(
                foregroundPainter: CiclePainter(),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CommonShowCode(
                codeText: CodeText.multiThreadCode,
              )
            ],
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

    Offset start = Offset(10, size.height / 2);
    Offset end = Offset(size.width - 10, size.height / 2);

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
    Offset midPointOfCircle = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(midPointOfCircle, size.height / 4, circleBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

  ''';
  static const String multiThreadCode = '''
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:testing/utils/code_text.dart';

import '../utils/common_widget_classes.dart';
import '../utils/constants.dart';

class MultiThreadingExample extends StatefulWidget {
  const MultiThreadingExample({super.key});

  @override
  State<MultiThreadingExample> createState() => _MultiThreadingExampleState();
}

class _MultiThreadingExampleState extends State<MultiThreadingExample> {
  bool showMoreInfo = false;

  toggleShowMoreInfo() {
    setState(() {
      showMoreInfo = !showMoreInfo;
    });
  }

  heavyTask(num, context) {
    int value = 0;
    for (int i = 0; i < num; i++) {
      value++;
    }
    var snackBar = SnackBar(
      content: Text("Without Isolate : \$value"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  isolateFunc(num, context) async {
    ReceivePort receivePort = ReceivePort();
    try {
      await Isolate.spawn(heavyTaskWithIsolate, [receivePort.sendPort, num]);
      final res = await receivePort.first;
      var snackBar = SnackBar(
        content: Text("With Isolate : \$res"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on Object {
      var snackBar = const SnackBar(
        content: Text("Isolation Failed"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      receivePort.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Multi Threading',
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'MultiThreading in Flutter',
                style:
                    googleFontStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Since We know that Dart is a Single threaded language. When some extensive tasks are performed the Main thread gets stuck hence the Ui is frozen until that task is Completed. To overCome this We can use isolates to open the main thread for displaying UI elements only and provide different thread for running Heavy tasks.',
                style:
                    googleFontStyle(fontSize: 14, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset("assets/ball.gif"),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  heavyTask(400000000, context);
                },
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder()),
                child: Text(
                  "RUN HEAVY tASK",
                  style: googleFontStyle(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  isolateFunc(400000000, context);
                },
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder()),
                child: Text(
                  "RUN HEAVY TASK with ISOLATE",
                  style: googleFontStyle(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  toggleShowMoreInfo();
                },
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder()),
                child: Text(" \${showMoreInfo ? "Hide" : "Show"}",
                  style: googleFontStyle(),
                ),
              ),
              const CommonShowCode(
                codeText: CodeText.multiThreadCode,
              )
            ],
          ),
        ),
      ),
    );
  }
}

int heavyTaskWithIsolate(List<dynamic> args) {
  SendPort resultPort = args[0];
  int value = 0;
  for (int i = 0; i < args[1]; i++) {
    value++;
  }
  Isolate.exit(resultPort, value);
}

''';
  static const String methodChannelCode = '''
  import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/utils/common_button.dart';
import 'package:testing/utils/common_snackbar.dart';

import '../utils/code_text.dart';
import '../utils/common_widget_classes.dart';
import '../utils/constants.dart';

class MethodChannelExample extends StatefulWidget {
  const MethodChannelExample({super.key});

  @override
  State<MethodChannelExample> createState() => _MultiThreadingExampleState();
}

class _MultiThreadingExampleState extends State<MethodChannelExample> {
  static const platform = MethodChannel("battery_channel");
  String _batteryLevel = "Unknown battery level";

  Future<void> _getBatterylevel(context) async {
    try {
      final result = await platform.invokeMethod<int>("getBatteryLevel");
      setState(() {
        _batteryLevel = 'Battery Level is \$result';
      });
    } on MissingPluginException {
      debugPrint('MissingPluginException');
      CommonSnackbar.showError(
          context: context, message: "Failed to get battery level");
    } on PlatformException catch (e) {
      CommonSnackbar.showError(
          context: context,
          message: "Failed to get battery level : \${e.message}");
    }
  }

  bool showMoreInfo = false;

  toggleShowMoreInfo() {
    setState(() {
      showMoreInfo = !showMoreInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Method Channel',
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Method Channel in Flutter',
                style:
                    googleFontStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                _batteryLevel,
                style:
                    googleFontStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: CommonButton.mainButton(
                  onTap: () async {
                    await _getBatterylevel(context);
                  },
                  text: "Get Battery Level",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CommonShowCode(
                codeText: CodeText.methodChannelCode,
              )
            ],
          ),
        ),
      ),
    );
  }
}


//--------------------------------------------android/app/src/main/kotlin/../MainActivity.kt file---------------------------------------------------->
package com.example.testing

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL =  "battery_channel"

    override fun configureFlutterEngine(@NonNull flutterEngine : FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "getBatteryLevel") {
                val  batteryLevel = getBatteryLevel()

                if (batteryLevel != -1){
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getBatteryLevel(): Int {
        var batteryLevel: Int
        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }
        return batteryLevel;
    }

}


  ''';
  static const String clipPathCustomContainerCode = '''
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
                codeText: CodeText.multiThreadCode,
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

  ''';
  static const String flutterLudoCode = '''
  
  
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:testing/features/flutter_ludo/ludo_controller/ludo_controller.dart';
import 'package:testing/utils/common_button.dart';
import 'package:testing/utils/common_snackbar.dart';
import 'package:testing/utils/common_widget_classes.dart';

import '../../utils/code_text.dart';
import '../../utils/constants.dart';


class FlutterLudo extends StatefulWidget {
  FlutterLudo({super.key});

  @override
  State<FlutterLudo> createState() => _FlutterLudoState();
}

class _FlutterLudoState extends State<FlutterLudo> {
  final ludoController = LudoController();
  Map selectedToken = {};
  int selectedPosition = 0;
  bool showPositions = false;
  bool showDebugMode = false;


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ludoController,
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Flutter Ludo',
            style: googleFontStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body:
            Obx(
                    ()=>
            SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: ludoController.paddingHorizontal, vertical: 10),
          child: Column(
            children: [
              // Text('steps : \${ludoController.steps.value}'),
              const SizedBox(height: 10,),
              if(ludoController.firstPlace.value != 0)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    if(ludoController.firstPlace.value != 0)
                      Text("First Place : Player \${ludoController.firstPlace()} - \${(ludoController.getPlayerColor(player : ludoController.firstPlace())).toString().capitalizeFirst}", style: googleFontStyle(fontSize: 18, color: Colors.white,),),

                    if(ludoController.secondPlace.value != 0)
                      Text("Second Place : Player \${ludoController.secondPlace()} - \${(ludoController.getPlayerColor(player : ludoController.secondPlace())).toString().capitalizeFirst}", style: googleFontStyle(fontSize: 18, color: Colors.white,),),

                    if(ludoController.thirdPlace.value != 0)
                      Text("Third Place : Player \${ludoController.thirdPlace()} - \${(ludoController.getPlayerColor(player : ludoController.thirdPlace())).toString().capitalizeFirst}", style: googleFontStyle(fontSize: 18, color: Colors.white,),),

                    if(ludoController.thirdPlace.value != 0)
                      Text("Fourth Place : Player \${ludoController.fourthPlace()} - \${(ludoController.getPlayerColor(player : ludoController.fourthPlace())).toString().capitalizeFirst}", style: googleFontStyle(fontSize: 18, color: Colors.white,),),
                  ],
                ),
              ),
              if(ludoController.firstPlace.value != 0)
              const SizedBox(height: 10,),

              Center(
                  child: Wrap(
                children: [
                  ...List.generate(225, (i) {
                    var token = ludoController.getToken(i);
                    var tokens = ludoController.checkForTokensAtPosition(i+1);
                    return  InkWell(
                      onTap: token == null
                          ? null : () {
                        if (ludoController.steps.value == 0) {
                          CommonSnackbar.showError(context: context, message: "Please Roll The Dice");
                          return;
                        }
                        ludoController.moveToken(
                          token: token,
                        );
                      },
                      child: Container(
                        width: (Get.size.width - ludoController.paddingHorizontal*2) / 15,
                        height: (Get.size.width - ludoController.paddingHorizontal*2) / 15,
                        decoration: BoxDecoration(
                            color: ludoController.getColor(i),
                            border: Border.all(
                                color: ludoController.playingPath.contains(i+1) || ludoController.greenColorBox.contains(i+1) || ludoController.yellowColorBox.contains(i+1) || ludoController.redColorBox.contains(i+1) || ludoController.blueColorBox.contains(i+1)  ? Colors.black.withOpacity(0.5) :  Colors.transparent ,
                                // color: Colors.black.withOpacity(0.4),
                                width: 0.5)),
                        child: Center(
                          child: token != null
                              ? Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: tokens.length > 1 ? FittedBox(
                                  child: Wrap(
                                    children: [
                                      ...tokens.map((t){
                                        return Icon(
                                          Icons.token,
                                          size: 16,
                                          color: ludoController.getTokenColor(t['color']),
                                        );
                                      }).toList()
                                    ],
                                  ),
                                ) : Icon(
                                  Icons.token,
                                  size: 16,
                                  color: ludoController.getTokenColor(token['color']),
                                ),
                              )
                              : Text(
                            !showPositions ?
                              ""
                                  :"\${i+1}", style: googleFontStyle(fontSize: 8),
                                  ),
                        ),
                      ),
                    );
                  })
                ],
              )),
              const SizedBox(height: 10),

              Container(
                width: Get.size.width,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text("\${ludoController.getPlayerColor().toString().capitalizeFirst} Player's Turn", style: googleFontStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ludoController.getButtomColor(),),)),
              ),
              const SizedBox(height: 10,),


              if (ludoController.diceNumber.value != 0 || ludoController.diceIsRolling.value)
                ludoController.diceIsRolling.value
                    ? SizedBox(
                        width: 100,
                        height: 70,
                        child: Lottie.asset("assets/dice_roll_gif.json"),
                      )
                    : SizedBox(
                        width: 100,
                        height: 70,
                        child: Center(
                          child: SizedBox(
                            width: 50,
                            child: Image.asset("assets/dice_\${ludoController.diceNumber.value}.png"),
                          ),
                        ),
                      ),
              const SizedBox(
                height: 10,
              ),
              if(ludoController.steps.value == 0)
              SizedBox(
                width: 100,
                child: CommonButton.mainButton(
                    text: "Roll Dice",
                    colorBg: ludoController.getButtomColor(),
                    onTap: () {
                      ludoController.rollDice();
                    }),
              ),
              // if(ludoController.steps.value == 0)
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 30,),
              const CommonShowCode(codeText: CodeText.flutterLudoCode),
              const SizedBox(height: 40,),
            ],
          ),
        ),
        ),
        bottomSheet: BottomSheet(
          builder: (context){
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonButton.mainButton(
                    text: showDebugMode? "Hide Debug Mode": "Show Debug Mode",
                    onTap: (){
                      setState(() {
                        showDebugMode = !showDebugMode;
                      });
                    },
                    colorBg: Colors.black
                ),


                // for changing the token position manually on the board for testing
                if(showDebugMode)
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              Text("Show Positions : ", style: googleFontStyle(color: Colors.white),),
                              Checkbox(value: showPositions, onChanged: (value){
                                setState(() {
                                  showPositions = value!;
                                });
                              }),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              Text("Token : ", style: googleFontStyle(color: Colors.white),),
                              PopupMenuButton(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: Colors.black
                                  ),
                                  child: Text(selectedToken.isNotEmpty ? "\${selectedToken['id']}"  :'select token', style: googleFontStyle(color: Colors.white),),
                                ),
                                // initialValue: selectedItem,
                                onSelected: (item) {
                                  setState(() {
                                    selectedToken = item;
                                  });
                                },
                                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                                  ...List.generate(ludoController.allTokens.length, (index){
                                    return PopupMenuItem(
                                      value: ludoController.allTokens[index],
                                      child: Text('\${ludoController.allTokens[index]['id']} - \${ludoController.allTokens[index]['color']} - Current Position : \${ludoController.allTokens[index]['position']}'),
                                    );
                                  }),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              Text("Position : ", style: googleFontStyle(color: Colors.white),),
                              PopupMenuButton(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: Colors.black
                                  ),
                                  child: Text(selectedPosition != 0 ? "\$selectedPosition"  :'select position', style: googleFontStyle(color: Colors.white),),
                                ),
                                // initialValue: selectedItem,
                                onSelected: (item) {
                                  setState(() {
                                    selectedPosition = item;
                                  });
                                },
                                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                                  ...List.generate(225, (index){
                                    return PopupMenuItem(
                                      value: index+1,
                                      child: Text('\${index+1}'),
                                    );
                                  }),
                                ],
                              ),
                            ],
                          ),
                        ),
                        CommonButton.mainButton(text: "set position",onTap: (){
                          debugPrint("\$selectedToken");
                          debugPrint("\$selectedPosition");
                          ludoController.setTokenPosition(token: selectedToken, newPosition: selectedPosition);
                          setState(() {});
                        }),

                      ],
                    ),
                  ),
              ],
            );
          }, onClosing: () {  },
        ),
      ),
    );
  }
}

//------ludo controller-------->

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

class LudoController extends GetxController{
  double paddingHorizontal = 0;
  RxInt firstPlace = 0.obs;
  RxInt secondPlace = 0.obs;
  RxInt thirdPlace = 0.obs;
  RxInt fourthPlace = 0.obs;


  List<int> lightGreenColorBox = [1,2,3,4,5,6,16,21,31,36,46,51,61,66,16,76,77,78,79,80,81];
  List<int> greenColorBox = [97,17,18,19,20,32,35,47,50,62,63,64,65,92,107,108,109,110,111];

  List<int> lightYellowColorBox = [10,11,12,13,14,15,25,30,40,45,55,60,70,75,85,86,87,88,89,90];
  List<int> yellowColorBox = [99,26,27,28,29,41,44,56,59,71,72,73,74,23,24,38,53,68,83];

  List<int> lightRedColorBox = [136,137,138,139,140,141,151,156,166,171,181,186,196,201,211,212,213,214,215,216];
  List<int> redColorBox = [127,152,153,154,155,167,170,182,185,197,198,199,200,202,203,143,158,173,188];

  List<int> lightBlueColorBox = [145,146,147,148,149,150,160,165,175,180,190,195,205,210,220,221,222,223,224,225];
  List<int> blueColorBox = [129,161,162,163,164,176,179,191,194,206,207,208,209,115,116,117,118,119,134];

  List<int> greyColorBox = [189,123,37,103];

  List<int> defaultColorBox = [98, 112,113,114,128];
  List<int> blackColorBox = [97,99,127,129,113];


  List<int> redTokenBase = [168, 169, 183, 184];
  List<int> greenTokenBase = [33,34,48,49];
  List<int> yellowTokenBase = [42,43,57,58];
  List<int> blueTokenBase = [177,178,192,193];

  List playingPath = [91,93,94,95,96,82,67,52,22,7,8,9,24,39,54,69,84,100,101,102,104,105,120,135,133,132,131,130,144,159,174,204,219,218,217,187,172,157,142,126,125,124,122,121,106];
  List pathForRed = [202,187,172,157,142,126,125,124,123,122,121,106,91,92,93,94,95,96,82,67,52,37,22,7,8,9,24,39,54,69,84,100,101,102,103,104,105,120,135,134,133,132,131,130,144,159,174,189,204,219,218,203,188,173,158,143,0];
  List pathForGreen = [92,93,94,95,96,82,67,52,37,22,7,8,9,24,39,54,69,84,100,101,102,103,104,105,120,135,134,133,132,131,130,144,159,174,189,204,219,218,217,202,187,172,157,142,126,125,124,123,122,121,106,107,108,109,110,111,0];
  List pathForYellow = [24,39,54,69,84,100,101,102,103,104,105,120,135,134,133,132,131,130,144,159,174,189,204,219,218,217,202,187,172,157,142,126,125,124,123,122,121,106,91,92,93,94,95,96,82,67,52,37,22,7,8,23,38,53,68,83,0];
  List pathForBlue = [134,133,132,131,130,144,159,174,189,204,219,218,217,202,187,172,157,142,126,125,124,123,122,121,106,91,92,93,94,95,96,82,67,52,37,22,7,8,9,24,39,54,69,84,100,101,102,103,104,105,120,119,118,117,116,115,0];

  List safePositions = [202,123,92,37,24,103,134,189];

  List playerTurns = [1,2,3,4];
  RxInt currentPlayerTurn = 1.obs;
  RxBool player1CompletedGame = false.obs;
  RxBool player2CompletedGame = false.obs;
  RxBool player3CompletedGame = false.obs;
  RxBool player4CompletedGame = false.obs;

  RxInt diceNumber = 0.obs;

  RxList<Map<String, Object>> allTokens = [
    {"id": 1, "color": "green", "position": 33, "basePosition": 33},
    {"id": 2, "color": "green", "position": 34, "basePosition": 34},
    {"id": 3, "color": "green", "position": 48, "basePosition": 48},
    {"id": 4, "color": "green", "position": 49, "basePosition": 49},
    {"id": 5, "color": "yellow", "position": 42, "basePosition": 42},
    {"id": 6, "color": "yellow", "position": 43, "basePosition": 43},
    {"id": 7, "color": "yellow", "position": 57, "basePosition": 57},
    {"id": 8, "color": "yellow", "position": 58, "basePosition": 58},
    {"id": 9, "color": "red", "position": 168, "basePosition": 168},
    {"id": 10, "color": "red", "position": 169, "basePosition": 169},
    {"id": 11, "color": "red", "position": 183, "basePosition": 183},
    {"id": 12, "color": "red", "position": 184, "basePosition": 184},
    {"id": 13, "color": "blue", "position": 177, "basePosition": 177},
    {"id": 14, "color": "blue", "position": 178, "basePosition": 178},
    {"id": 15, "color": "blue", "position": 192, "basePosition": 192},
    {"id": 16, "color": "blue", "position": 193, "basePosition": 193},
  ].obs;
  RxInt steps = 0.obs;
  RxBool diceIsRolling = false.obs;

  /// takes the position on the board and returns the color of the box for the design
  Color getColor(int i) {
    if (lightGreenColorBox.contains(i + 1)) {
      return Colors.greenAccent;
    } else if (blackColorBox.contains(i + 1)) {
      return Colors.black;
    } else if (greenColorBox.contains(i + 1)) {
      return Colors.green;
    } else if (lightYellowColorBox.contains(i + 1)) {
      return Colors.yellowAccent;
    } else if (yellowColorBox.contains(i + 1)) {
      return Colors.yellow;
    } else if (lightRedColorBox.contains(i + 1)) {
      return Colors.redAccent;
    } else if (redColorBox.contains(i + 1)) {
      return Colors.red;
    } else if (lightBlueColorBox.contains(i + 1)) {
      return Colors.blueAccent;
    } else if (blueColorBox.contains(i + 1)) {
      return Colors.blue;
    } else if (greyColorBox.contains(i + 1)) {
      return getRandomColor();
    } else if (defaultColorBox.contains(i + 1)) {
      return Colors.grey.withOpacity(.1);
    }
    return Colors.white;
  }

  /// get token color with a color string name
  /// Ex: getTokenColor("green") return Colors.green
  Color getTokenColor(String color) {
    switch (color) {
      case "green":
        return Colors.green;
      case "red":
        return Colors.red;
      case "blue":
        return Colors.blue;
      case "yellow":
        return const Color(0xffe0bc00);
        // return Colors.yellow;
      default:
        return Colors.white;
    }
  }


  /// returns a single token on a position or null if no token is present
  getToken(i) {
    List tokens = checkForTokensAtPosition(i+1);
    if(tokens.isEmpty){
      return null;
    }else{
      if(tokens.length == 1){
        return tokens[0];
      }else{
        int index = tokens.indexWhere((t) => t['color'] == getPlayerColor());
        if (index != -1) {
          return tokens[index];
        }else{
          return tokens[0];
        }
      }
    }
  }

  /// rolls the dice and checks for valid moves for current player
  rollDice() async {
      diceIsRolling.value = true;
    await Future.delayed(Duration(seconds: 1), () {
        int randomValue = getRandomNumber();
        diceNumber.value = randomValue;
        if(steps.value == 6){
          steps.value += randomValue;
        }else{
          steps.value = randomValue;
        }

        diceIsRolling.value = false;
        if(steps.value < 6){
          if(checkAllTokenAreInBase() || !checkIfTheMoveIsPlayable()){
            steps.value = 0;
            nextTurn();
          }
        }else if(steps.value == 6){
          if(!checkAllTokenAreInBase() && !checkIfTheMoveIsPlayable()){
            steps.value = 0;
            nextTurn();
          }
        }else if(steps > 6){
          if(checkAllTokenAreInBase() || !checkIfTheMoveIsPlayable()){
            steps.value = 0;
            nextTurn();
          }
        }

      });
  }

  /// checks if all tokens are in base or completed
  checkAllTokenAreInBase(){
    if(currentPlayerTurn == 1 && (allTokens.value[8]['position'] == 168 || allTokens.value[8]['position'] == 0) && (allTokens.value[9]['position'] == 169 || allTokens.value[9]['position'] == 0) && (allTokens.value[10]['position'] == 183 || allTokens.value[10]['position'] == 0) && (allTokens.value[11]['position'] == 184 || allTokens.value[11]['position'] == 0))return true;
    if(currentPlayerTurn == 2 && (allTokens.value[0]['position'] == 33 || allTokens.value[0]['position'] == 0) && (allTokens.value[1]['position'] == 34 || allTokens.value[1]['position'] == 0) && (allTokens.value[2]['position'] == 48 || allTokens.value[2]['position'] == 0) && (allTokens.value[3]['position'] == 49 || allTokens.value[3]['position'] == 0))return true;
    if(currentPlayerTurn == 3 && (allTokens.value[4]['position'] == 42 || allTokens.value[4]['position'] == 0) && (allTokens.value[5]['position'] == 43 || allTokens.value[5]['position'] == 0) && (allTokens.value[6]['position'] == 57 || allTokens.value[6]['position'] == 0) && (allTokens.value[7]['position'] == 58 || allTokens.value[7]['position'] == 0))return true;
    if(currentPlayerTurn == 4 && (allTokens.value[12]['position'] == 177 || allTokens.value[12]['position'] == 0) && (allTokens.value[13]['position'] == 178 || allTokens.value[13]['position'] == 0) && (allTokens.value[14]['position'] == 192 || allTokens.value[14]['position'] == 0) && (allTokens.value[15]['position'] == 193 || allTokens.value[15]['position'] == 0))return true;
    return false;
  }

  /// generates a random number between 1 to 6
  int getRandomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(6);
    return randomNumber + 1;
  }

  /// changes the turn to the next player
  nextTurn(){
    int index = playerTurns.indexOf(currentPlayerTurn.value);
    if(index == playerTurns.length-1){
      currentPlayerTurn.value = playerTurns[0];
    }else{
      currentPlayerTurn.value = playerTurns[index+1];
    }
  }

  /// set the completed player in the scoreboard list and remove from the turns
  setPlayerCompetedGame(int player){
    if(firstPlace.value == 0){
      firstPlace.value = player;
    }else if(secondPlace.value == 0){
      secondPlace.value = player;
    }else if(thirdPlace.value == 0){
      thirdPlace.value = player;
    }
    switch(player){
      case 1:
        player1CompletedGame.value = true;
        playerTurns.remove(player);
        break;
      case 2:
        player2CompletedGame.value = true;
        playerTurns.remove(player);
        break;
      case 3:
        player3CompletedGame.value = true;
        playerTurns.remove(player);
        break;
      case 4:
        player4CompletedGame.value = true;
        playerTurns.remove(player);
        break;
      default:
        break;
    }

  }

  /// gets an integer and return the color string (ex: "green") of the current player
  getPlayerColor({int? player}){
    switch(player ?? currentPlayerTurn.value){
      case 1:
        return "red";
      case 2:
        return "green";
      case 3:
        return "yellow";
      case 4:
        return "blue";
    }
  }


  /// moves the token while checking the token color
  moveToken({
    required Map<String, Object> token,
  }) {
    debugPrint("getPlayerColor() != token['color'] : \${getPlayerColor() != token['color']}");
    if(getPlayerColor() != token['color'])return;

    int index = findTokenIndex(token);
    if (token['color'] == "red") {
      moveTokenBasedOnColor(token: token, colorTokenBase: redTokenBase, pathForColor: pathForRed);
    }

    if (token['color'] == "green") {
      moveTokenBasedOnColor(token: token, colorTokenBase: greenTokenBase, pathForColor: pathForGreen);
    }

    if (token['color'] == "yellow") {
      moveTokenBasedOnColor(token: token, colorTokenBase: yellowTokenBase, pathForColor: pathForYellow);
    }

    if (token['color'] == "blue") {
      moveTokenBasedOnColor(token: token, colorTokenBase: blueTokenBase, pathForColor: pathForBlue);
    }
  }

  /// moves the token based on the color
  moveTokenBasedOnColor({required token, required List colorTokenBase, required List pathForColor }){
    if (colorTokenBase.contains(token['position'])) {
      if (steps.value == 6) {
        setTokenPosition(token: token, newPosition: pathForColor[0]);
        steps.value = 0;
        nextTurn();
      }
    } else {
      int pathIndex = pathForColor.indexOf(token['position']);
      int newPositionIndex = pathIndex + steps.value;
      if (newPositionIndex < pathForColor.length) {

        if(!safePositions.contains(pathForColor[newPositionIndex])){
          List itemsAtPosition = checkForTokensAtPosition(pathForColor[newPositionIndex]);
          debugPrint("itemsAtPosition : \$itemsAtPosition");
          if(itemsAtPosition.isNotEmpty){
            if(itemsAtPosition.length > 1){
              setTokenPosition(token: token, newPosition: pathForColor[newPositionIndex]);
              steps.value = 0;
              nextTurn();
            }else{
              if(itemsAtPosition[0]['color'] == token['color']){
                setTokenPosition(token: token, newPosition: pathForColor[newPositionIndex]);
                steps.value = 0;
                nextTurn();
              }else{
                killAToken(newToken: token, oldToken: itemsAtPosition[0]);
              }
            }

          }else{
            setTokenPosition(token: token, newPosition: pathForColor[newPositionIndex]);
            steps.value = 0;
            nextTurn();
          }
        }else{
          setTokenPosition(token: token, newPosition: pathForColor[newPositionIndex]);
          steps.value = 0;
          nextTurn();
        }
      }
    }
  }

  /// returns the list of tokens at a particular position
  List checkForTokensAtPosition(int position){
    List tokens = [];
    List getToken = allTokens.where((token) =>token['position'] == position).toList();
    if(getToken.isNotEmpty) return getToken;
    return tokens;
  }

  /// accepts oldToken and newToken and replaces newToken with oldToken and resets all token to base position
  killAToken({required oldToken, required newToken}){
    int oldTokenIndex = findTokenIndex(oldToken);
    setTokenPosition(token: newToken, newPosition: allTokens.value[oldTokenIndex]['position']);
    setTokenPosition(token: oldToken, newPosition: allTokens.value[oldTokenIndex]['basePosition']);
  }

  /// accepts token and returns its index in allTokens list
  int findTokenIndex(token){
    return allTokens.indexWhere((t) => t["id"] == token['id']);
  }

  /// accepts token and position and set the token to this position on the board
  setTokenPosition({required token, required newPosition}){
    int index = findTokenIndex(token);
    allTokens.value[index] = {
      ...token,
      "position": newPosition
    };
    if(newPosition == 0){
      if(checkIfPlayerIsCompleted(token)){
        setPlayerCompetedGame(currentPlayerTurn.value);
      }
    }
  }

  /// accepts a token, based on the token color checks if the player has completed the game.
  bool checkIfPlayerIsCompleted(token){
    bool completed = true;
    for (var t in allTokens) {
      if(t['color'] == token['color']){
        if(t['position'] != 0){
          completed = false;
        }
      }
    }
    return completed;
  }

  /// returns list of path positions of current player
  List getPlayerPath(){
    switch(currentPlayerTurn.value){
      case 1:
        return pathForRed;
      case 2:
        return pathForRed;
      case 3:
        return pathForYellow;
      case 4:
        return pathForBlue;
      default:
        return [];
    }
  }

  /// checks if the move is playable or not for current player
  bool checkIfTheMoveIsPlayable(){
    String currentPlayerColor = getPlayerColor();
    List currentPlayerPath = getPlayerPath();
    int count = 0;
    for(int i = 0; i < allTokens.length; i++){
      if(count == 4) break;
      if(allTokens.value[i]['color'] == currentPlayerColor){
        debugPrint("\${allTokens.value[i]}");
        count++;
        int positionIndex = currentPlayerPath.indexOf(allTokens.value[i]['position']);
        debugPrint("count : \$count");
        // debugPrint("count : \${count}");
        debugPrint("positionIndex : \$positionIndex");
        debugPrint("steps : \$steps");
        // debugPrint("count : \${count}");
        if((steps.value + positionIndex) < currentPlayerPath.length)return true;
      }
    }
    return false;
  }

  /// return current Player Color
  Color getButtomColor(){
    if(currentPlayerTurn.value == 1)return Colors.red;
    if(currentPlayerTurn.value == 2)return Colors.green;
    if(currentPlayerTurn.value == 3)return const Color(0xffe0bc00);
    // if(currentPlayerTurn.value == 3)return Colors.yellow;
    if(currentPlayerTurn.value == 4)return Colors.blue;
    return Colors.black;
  }
}
  
  ''';
  static const String flutterAnimationExample1 = '''
  import 'dart:isolate';
import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing/utils/code_text.dart';
import 'package:testing/utils/common_button.dart';
import 'package:testing/utils/common_snackbar.dart';

import '../../utils/common_widget_classes.dart';
import '../../utils/constants.dart';

class AnimationExample1 extends StatefulWidget {
  const AnimationExample1({super.key});

  @override
  State<AnimationExample1> createState() => _AnimationExample1State();
}

class _AnimationExample1State extends State<AnimationExample1> with SingleTickerProviderStateMixin {

  late AnimationController _controllerRotateAxis;
  late Animation _animationRotateAxis;

  @override
  void initState() {
    _controllerRotateAxis = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2)
    );

    _animationRotateAxis = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controllerRotateAxis);

    _controllerRotateAxis.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controllerRotateAxis.dispose();
    super.dispose();
  }

  List points = [
    "Flutter canvas starts for top left corner. Positive Y axis goes downwards.",
    "Flutter angles are calculated clockwise positively.",
    "pi = 180 degree",
    "AnimationController vsync : this, using mixins SingleTickerProviderStateMixin binds the animation with the current screen or widget refresh rate.",
    "Tween animation is used to give a range of value with begin and end. tween = between",
    "AnimatedBuilder listens for value change in animation and calling the builder again to show the changes of the animation controller and animation."
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Example 1',
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
                  animation: _controllerRotateAxis,
                  builder: (context, child){
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(_animationRotateAxis.value),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black87,
                                  blurRadius: 7,
                                  spreadRadius: 6,
                                  offset: Offset(2,2)
                              )
                            ]
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 30,),
            const CommonShowCode(codeText: CodeText.flutterAnimationExample1,),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

  ''';
  static const String flutterAnimationExample2 = '''
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

  ''';
  static const String flutterAnimationExample3 = '''
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
            const CommonShowCode(codeText: CodeText.flutterAnimationExample1,),
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

  ''';
  static const String flutterAnimationExample4 = '''
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
            const CommonShowCode(codeText: CodeText.flutterAnimationExample3,),
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

  ''';

  static const String flutterAnimationExample5 = '''
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
              codeText: CodeText.flutterAnimationExample4,
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

''';

  static const String spinnerCode = '''
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
                          "\$currency",
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
      debugPrint("state angle : \$startAngle");
      debugPrint("end angle : \$endAngle");
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
        text: '\${values[i - 1]}',
        // text: '\${i * 100 / sections}',
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


''';

  static const String customClockCode = '''
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
      child: CustomPaint(
        painter: ClockPainter(),
        child: const SizedBox(
          height: 200,
          width: 200,
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

''';

  static const String factoryMethodDPCode = '''
  //-------------Platform_button.dart-------------->
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformButton {
  Widget build(VoidCallback onPressed, Widget child);

  factory PlatformButton(TargetPlatform platform){
    switch(platform){
      case TargetPlatform.android:
        return AndroidButton();

      case TargetPlatform.iOS:
        return IosButton();

      default:
        return AndroidButton();
    }
  }
}

class AndroidButton implements PlatformButton{
  @override
  Widget build(VoidCallback onPressed, Widget child) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }
}

class IosButton implements PlatformButton{
  @override
  Widget build(VoidCallback onPressed, Widget child) {
    return CupertinoButton(child: child, onPressed: onPressed);
  }
}

//----------------------factory_method_DP.dart-------------------->

import 'package:flutter/material.dart';
import 'package:testing/features/flutter_design_patterns/factory_method_DP/platform_button.dart';
import 'package:testing/utils/code_text.dart';
import '../../../utils/common_widget_classes.dart';
import '../../../utils/constants.dart';

class FactoryMethodDp extends StatelessWidget {
  FactoryMethodDp({super.key});

  List points = [
    "Define an interface for creating an object, but let subclasses decide which class to instantiate. Factory Method lets a class defer instantiation to sub­classes.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Factory Method',
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Android Button", style: googleFontStyle(color: Colors.white),),
                        const SizedBox(width: 10,),
                        PlatformButton(TargetPlatform.android).build((){}, const Text("Click")),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("IOS Button", style: googleFontStyle(color: Colors.white),),
                        const SizedBox(width: 10,),
                        PlatformButton(TargetPlatform.iOS).build((){}, const Text("Click")),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Current Platform Button", style: googleFontStyle(color: Colors.white),),
                        const SizedBox(width: 10,),
                        PlatformButton(Theme.of(context).platform).build((){}, const Text("Click")),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30,),
            const CommonShowCode(codeText: CodeText.flutterAnimationExample1,),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

  ''';

  static const String abstractFactoryDPCode = '''
  //-----------------platform_button.dart------------------------>
  
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformButton {
  Widget build(VoidCallback onPressed, Widget child);

  factory PlatformButton(TargetPlatform platform){
    switch(platform){
      case TargetPlatform.android:
        return AndroidButton();

      case TargetPlatform.iOS:
        return IosButton();

      default:
        return AndroidButton();
    }
  }
}

class AndroidButton implements PlatformButton{
  @override
  Widget build(VoidCallback onPressed, Widget child) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }
}

class IosButton implements PlatformButton{
  @override
  Widget build(VoidCallback onPressed, Widget child) {
    return CupertinoButton(child: child, onPressed: onPressed);
  }
}

//----------------------------platform_loader.dart----------------------->

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract interface class PlatformLoader{
  Widget build();

  factory PlatformLoader(TargetPlatform platform){
    switch(platform){
      case TargetPlatform.android:
        return AndroidLoader();
      case TargetPlatform.iOS:
        return IOSLoader();
      default:
        return IOSLoader();
    }
  }
}

class AndroidLoader implements PlatformLoader{
  @override
  Widget build() {
    return CircularProgressIndicator();
  }
}

class IOSLoader implements PlatformLoader{
  @override
  Widget build() {
    return CupertinoActivityIndicator();
  }
}

//-----------------------------abstruct_factory_DP.dart------------------------->

import 'package:flutter/material.dart';
import 'package:testing/features/flutter_design_patterns/factory_method_DP/platform_loader.dart';

import '../factory_method_DP/platform_button.dart';


abstract interface class AbstructFactoryDPPlatform {
  Widget buildButton(BuildContext context, VoidCallback onPressed, Widget child);
  Widget buildLoader(BuildContext context);
}

class AbstructFactoryDpPlatformImpl implements AbstructFactoryDPPlatform{
  @override
  Widget buildButton(BuildContext context, VoidCallback onPressed, Widget child) {
    return PlatformButton(Theme.of(context).platform).build(onPressed, child);
  }

  @override
  Widget buildLoader(BuildContext context) {
    return PlatformLoader(Theme.of(context).platform).build();
  }
}

//-----------------------------AbstructFactoryDPExample.dart------------------------->


import 'package:flutter/material.dart';
import 'package:testing/features/flutter_design_patterns/abstruct_factory_DP/abstruct_factory_DP.dart';
import 'package:testing/features/flutter_design_patterns/factory_method_DP/platform_button.dart';
import 'package:testing/utils/code_text.dart';
import '../../../utils/common_widget_classes.dart';
import '../../../utils/constants.dart';

class Abstructfactorydpexample extends StatelessWidget {
  Abstructfactorydpexample({super.key});

  List points = [
    "Provide an interface for creating families of related or dependent objects without specifying their concrete classes.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Abstract Factory',
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
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Current Platform Button", style: googleFontStyle(),),
                            const SizedBox(width: 10,),
                            PlatformButton(Theme.of(context).platform).build((){}, const Text("Click")),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Current Platform Loader", style: googleFontStyle(),),
                            const SizedBox(width: 10,),
                            AbstructFactoryDpPlatformImpl().buildLoader(context),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30,),
            const CommonShowCode(codeText: CodeText.flutterAnimationExample1,),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

  ''';

  static const String singletonDPCode = '''
  //--------------------------singleton_DP.dart----------------------------->
  
  class EmployeeSingleton{
  String? name;

  static EmployeeSingleton? _instance;

  // private constructor
  EmployeeSingleton._privateConstructor(this.name);

  // create default instance
  static final EmployeeSingleton _defaultInstance = EmployeeSingleton._privateConstructor('Chintu');

  // method 1
  // static EmployeeSingleton getInstance(){
  //   _instance ??= _defaultInstance;
  //   return _instance!;
  // }

  // method 2
  // static EmployeeSingleton get instance {
  //   _instance ??= _defaultInstance;
  //   return _instance!;
  // }

  // method 3
  factory EmployeeSingleton(){
      _instance ??= _defaultInstance;
      return _instance!;
  }


}

//----------------------------------single_DP_example.dart--------------------->


import 'package:flutter/material.dart';
import 'package:testing/features/flutter_design_patterns/singleton_DP/singleton_DP.dart';
import 'package:testing/utils/code_text.dart';
import '../../../utils/common_widget_classes.dart';
import '../../../utils/constants.dart';

class SingleDpExample extends StatefulWidget {
  SingleDpExample({super.key});

  @override
  State<SingleDpExample> createState() => _SingleDpExampleState();
}

class _SingleDpExampleState extends State<SingleDpExample> {
  List points = [
    "Singleton is a creational design pattern that ensures that a class has only one instance and also provides a global point of access to it.",
  ];

  late EmployeeSingleton employee1 = EmployeeSingleton();

  late EmployeeSingleton employee2 = EmployeeSingleton();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Singleton',
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
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(child: component1(employee1, (){
                      setState(() {});
                    })),
                    const SizedBox(height: 20,),
                    Expanded(child: component1(employee2,(){
                    setState(() {});
                    })),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30,),
            const CommonShowCode(codeText: CodeText.flutterAnimationExample1,),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

Widget component1(EmployeeSingleton employee, VoidCallback onPressed){
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 3)
    ),
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Employee name : \${employee.name}", style: googleFontStyle(),),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            if(employee.name == "Chintu"){
              employee.name = "Pintu";
            }else{
              employee.name = "Chintu";
            }
            onPressed();
          }, child: const Text('Change Name'))
        ],
      ),
    ),
  );
}

  ''';

  static const String prototypeDPCode = '''
  //--------------------prototype_DP.dart---------------------->
  
  class Person {
  String name;
  int age;
  String country;

  Person({
    required this.name,
    required this.age,
    required this.country,
  });

  Person copyWith({
    String? name,
    int? age,
    String? country,
}){
    return Person(name: name ?? this.name, age: age ?? this.age, country: country ?? this.country);
  }

  Person clone(){
    return copyWith(name: name, age : age, country: country);
  }

  void setter({
    String? name,
    int? age,
    String? country,
  }){
    this.name = name ?? this.name;
    this.age = age ?? this.age;
    this.country = country ?? this.country;
  }
}

//-----------------------------------prototype_DP_example.dart-------------------->


import 'package:flutter/material.dart';
import 'package:testing/features/flutter_design_patterns/prototype_%20DP/prototype_DP.dart';
import 'package:testing/utils/code_text.dart';
import '../../../utils/common_widget_classes.dart';
import '../../../utils/constants.dart';

class PrototypeDpExample extends StatefulWidget {
  PrototypeDpExample({super.key});

  @override
  State<PrototypeDpExample> createState() => _PrototypeDpExampleState();
}

class _PrototypeDpExampleState extends State<PrototypeDpExample> {
  List points = [
    "Specify the kinds of objects to create using a prototypical instance, and create new objects by copying this prototype.",
  ];

  Person personPrototype = Person(name: "Test Name", age: 10, country: "India");
  List<Person> persons = [];

  addNewPerson(){
    Person newPerson = personPrototype.clone();
    setState(() {
      persons.add(newPerson);
    });
  }

  refresh(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Singleton',
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
            const SizedBox(height: 20,),
            ListView.separated(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemBuilder: (context, i)=>personComponent(persons[i], context, refresh), separatorBuilder: (context, i)=> const SizedBox(height: 10,), itemCount: persons.length),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              addNewPerson();
            }, child: const Text('Add New Person')),
            const SizedBox(height: 30,),
            const CommonShowCode(codeText: CodeText.flutterAnimationExample1,),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

Widget personComponent(Person person, BuildContext context, VoidCallback refresh){
  return ListTile(
    leading: const Icon(Icons.person, color: Colors.blue,),
    title: Text(person.name, style: googleFontStyle(),),
    subtitle: Text("\${person.age} - \${person.country}"),
    trailing: IconButton(icon: const Icon(Icons.edit), onPressed: (){
      showDialog(context: context, builder: (_){
        final nameField = TextEditingController();
        return AlertDialog(
          title: Text("Change Name", style: googleFontStyle(),),
          content: Column(
            children: [
              TextFormField(
                controller: nameField,
              )
            ],
          ),
          actions: [
            ElevatedButton(onPressed: (){
              if(nameField.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red,content: Text("Enter Name", style: googleFontStyle(color: Colors.white),),));
                return;
              }
              person.setter(name: nameField.text);
              Navigator.pop(context);
              refresh();
            }, child: Text("OK", style: googleFontStyle(),)),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Cancel", style: googleFontStyle(),)),
          ],
        );
      });
    },),
  );
}

  ''';

  static const String adapterDPCode = '''
  //-------------------------------adapter_DP.dart----------------------->
  
  import 'dart:convert';

class GetYouTubePost{
  String getYouTubePosts(){
    return '
  [
  {
    "title": "What is Flutter",
    "description": "About flutter"
  },
  {
  "title": "What is Widgets in flutter",
  "description": "all about widgets"
}
]
';
  }
}

class GetInstaPost{
  String getInstaPost(){
    return '
[
{
"heading": "What is flutter used for?",
"subHeading": "flutter uses"
},
{
"heading": "Design pattern in flutter",
"subHeading": "design patterns"
}
]
';
  }
}

abstract class GetPost{
  List<Post> getPost();
}

class GetYouTubePostAdapter implements GetPost{

  final GetYouTubePost getYouTubePost = GetYouTubePost();

  @override
  List<Post> getPost() {
    final data = jsonDecode(getYouTubePost.getYouTubePosts()) as List;
    return data.map((e) => Post(e['title'], e['description'], PostSource.youtube)).toList();
  }

}

class GetInstaPostAdapter implements GetPost{

  final GetInstaPost getInstaPost = GetInstaPost();

  @override
  List<Post> getPost() {
    final data = jsonDecode(getInstaPost.getInstaPost()) as List;
    return data.map((e) => Post(e['heading'], e['subHeading'], PostSource.instagram)).toList();
  }

}

class GetAllPosts implements GetPost{
  final GetInstaPostAdapter getInstaPostAdapter = GetInstaPostAdapter();
  final GetYouTubePostAdapter getYouTubePostAdapter = GetYouTubePostAdapter();
  @override
  List<Post> getPost() {
    return getYouTubePostAdapter.getPost() + getInstaPostAdapter.getPost();
  }

}

class Post {
  String title;
  String subTitle;
  PostSource source;

  Post(this.title, this.subTitle, this.source);
}

enum PostSource  {youtube, instagram}

//-------------------------adapter_DP_example.dart------------------------>


import 'package:flutter/material.dart';
import 'package:testing/utils/code_text.dart';
import 'package:testing/utils/common_images.dart';
import '../../../utils/common_widget_classes.dart';
import '../../../utils/constants.dart';
import 'adapter_DP.dart';

class AdapterDpExample extends StatelessWidget {
  AdapterDpExample({super.key});
  final getAllPosts = GetAllPosts();

  List points = [
    "Convert the interface of a class into another interface clients expect. Adapter lets classes work together that couldn’t otherwise because of incompatible interfaces.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Adapter',
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
            const SizedBox(height: 30,),
            ListView.separated(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemBuilder: (context, i){
              Post post = getAllPosts.getPost()[i];
              return postComponent(post);
            }, separatorBuilder: (context, i)=> const SizedBox(height: 10,), itemCount: getAllPosts.getPost().length),
            const SizedBox(height: 30,),
            const CommonShowCode(codeText: CodeText.flutterAnimationExample1,),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

Widget postComponent(Post post){
  return ListTile(
    leading: Image.asset(getImage(post.source), width: 50, height: 50,),
    title: Text(post.title, style: googleFontStyle(),),
    subtitle: Text(post.subTitle),
  );
}

String getImage(PostSource source){
  switch(source){
    case PostSource.youtube:
      return CommonImages.youtubeIcon;
    case PostSource.instagram:
      return CommonImages.instaIcon;
    default:
      return CommonImages.youtubeIcon;
  }
}


  ''';

  static const String internalDrawerCode = '''
  
  //--------------------------------root_page.dart----------------------------->
  
  import 'package:flutter/material.dart';
import 'package:testing/utils/constants.dart';

import 'home_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 100, // Adjust width as needed
            color: Colors.blue,
            child: Center(
              child: Text(
                'Fixed Container',
                style: googleFontStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(child: Navigator(
            onGenerateRoute: (RouteSettings settings) {
              return MaterialPageRoute(
                builder: (context) => HomePage(),
              );
            },
          ),)
        ],
      ),
    );
  }
}



//-----------------------------------home_page.dart---------------------------------->

import 'package:flutter/material.dart';
import '../../utils/code_text.dart';
import '../../utils/common_widget_classes.dart';
import '../../utils/constants.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List points = [
    "Adding a Fixed Colum Container before drawer",
    "Create a different Navigator for the Inner Scaffold to separate drawer Navigation from outer Scaffold.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home" , style: googleFontStyle(),),
        centerTitle: true,
      ),
      drawer: Drawer(
        width: 200,
        backgroundColor: Colors.brown,
        child: Column(
          children: [
            const DrawerHeader(child: Icon(Icons.person),),
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text("Close", style: googleFontStyle(color: Colors.white),))
          ],
        ),
      ),
      drawerEnableOpenDragGesture: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20,),
            Text(
              'Internal Drawer in web',
              style:
              googleFontStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
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
            const SizedBox(
              height: 20,
            ),
            const CommonShowCode(
              codeText: CodeText.multiThreadCode,
            )
          ],
        ),
      ),
    );
  }
}
  ''';

  static const String jobSchedulerCronCode = '''
  
  import 'dart:async';

import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:testing/utils/constants.dart';
import 'package:testing/utils/extension_custom.dart';

import '../utils/code_text.dart';
import '../utils/common_widget_classes.dart';

class JobSchedulerCronJob extends StatefulWidget {
  JobSchedulerCronJob({super.key});

  @override
  State<JobSchedulerCronJob> createState() => _JobSchedulerCronJobState();
}

class _JobSchedulerCronJobState extends State<JobSchedulerCronJob> {
  final cron = Cron();

  ScheduledTask? scheduledTask;
  String scheduledText = '';
  StreamController isTaskRunningStreamController = StreamController<bool>();
  late Stream isTaskRunningStream;

  addToStream(bool status) {
    isTaskRunningStreamController.sink.add(status);
  }

  List points = [
    "Cron is a JobScheduler",
    "Cron can schedule a task while the app is in foreground.",
  ];

  @override
  void initState() {
    // TODO: implement initState
    isTaskRunningStream = isTaskRunningStreamController.stream;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cron JobScheduler",
          style: googleFontStyle(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => pointItem(point: points[i]),
                separatorBuilder: (context, i) => const SizedBox(
                      height: 10,
                    ),
                itemCount: points.length),

            Container(
              width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                child: StreamBuilder(
                  stream: isTaskRunningStream,
                  builder: (context, snapShot){
                    final data = snapShot.data;
                    if(data ?? false){
                      return Text(
                        "Task Status : Running",
                        style: googleFontStyle(color: Colors.white),
                      );
                    }
                    return Text(
                      "Task Status : Not Running",
                      style: googleFontStyle(color: Colors.white),
                    );
                  },
                ),),
            if(scheduledText.isNotEmpty)
            Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                child: Text(
                  scheduledText,
                  style: googleFontStyle(color: Colors.white),
                )),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: scheduleTask,
                  child: const Text("Schedule Task"),
                )),
                Expanded(
                    child: ElevatedButton(
                  onPressed: cancelTask,
                  child: const Text("Cancel Task"),
                )),
              ].addGap(const SizedBox(
                width: 10,
              )),
            ),
            const CommonShowCode(
              codeText: CodeText.jobSchedulerCronCode,
            )
          ].addGap(const SizedBox(height: 20)),
        ),
      ),
    );
  }

  void scheduleTask() async {
    try {
      scheduledTask = cron.schedule(Schedule.parse('*/6 * * * * *'), () {
        setState(() {
          scheduledText =
              'hello : the time is \${DateTime.now().toIso8601String()}';
        });
      });
      addToStream(true);
    } on ScheduleParseException {
      // "ScheduleParseException" is thrown if cron parsing is failed.
      debugPrint("something went wrong");
      addToStream(false);
      await cron.close();
    }
  }

  void cancelTask() {
    if (scheduledTask != null) {
      scheduledTask!.cancel();
      addToStream(false);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cron.close();
    isTaskRunningStreamController.close();
    super.dispose();
  }
}

  ''';

  static const String accelerometerSensorCode = '''
  import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:testing/utils/common_images.dart';
import 'package:testing/utils/constants.dart';
import 'package:testing/utils/extension_custom.dart';
import '../../utils/code_text.dart';
import '../../utils/common_widget_classes.dart';

class AccelerometerFlutter extends StatefulWidget {
  AccelerometerFlutter({super.key});

  @override
  State<AccelerometerFlutter> createState() => _AccelerometerFlutterState();
}

class _AccelerometerFlutterState extends State<AccelerometerFlutter> {
  List points = [
    "Package : sensors_plus",
    "AccelerometerEvent describes the acceleration of the device, in m/s2, including the effects of gravity. This stream reports raw data from the accelerometer (physical sensor embedded in the mobile device) without any post-processing. The accelerometer is unable to distinguish between the effect of an accelerated movement of the device and the effect of the surrounding gravitational field. This means that, at the surface of Earth, even if the device is completely still, the reading of AccelerometerEvent is an acceleration of intensity 9.8 directed upwards (the opposite of the graviational acceleration). This can be used to infer information about the position of the device (horizontal/vertical/tilted). AccelerometerEvent reports zero acceleration if the device is free falling.",
  ];

  late StreamSubscription _streamSubscription;
  double prevXAngle = 0.0;
  double xAngle = 0.0;
  double prevYAngle = 0.0;
  double yAngle = 0.0;
  double prevZAngle = 0.0;
  double zAngle = 0.0;
  double width = 450;
  double height = 700;

  @override
  void initState() {
    _streamSubscription = accelerometerEventStream().listen(
      (AccelerometerEvent event) {
        print(event);
        setState(() {
          prevXAngle = xAngle;
          xAngle = event.x;
          prevYAngle = yAngle;
          yAngle = double.parse(event.y.toString());
          prevZAngle = zAngle;
          zAngle = double.parse(event.z.toString());
        });
      },
      onError: (error) {
        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Accelerometer",
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 500,
              decoration: const BoxDecoration(color: Colors.black),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    left: xAngle * -3,
                    right: xAngle * 3,
                    top: zAngle * -3,
                    bottom: zAngle * 3,
                    duration: const Duration(milliseconds: 200),
                    child: Center(
                      child: TweenAnimationBuilder(
                          tween: Tween(begin: prevXAngle, end: xAngle),
                          duration: const Duration(milliseconds: 300),
                          builder: (context, double xValue, _) {
                            return TweenAnimationBuilder(
                                tween: Tween(begin: prevZAngle, end: zAngle),
                                duration: const Duration(milliseconds: 300),
                                builder: (context, double zValue, _) {
                                  return Transform(
                                    origin: Offset(width / 2, height / 2),
                                    transform: Matrix4.identity()
                                      ..setEntry(2, 1, 0.001)
                                      ..rotateX(-zValue / 30)
                                      ..rotateY(xValue / 30),
                                    child: Container(
                                      width: width / 2,
                                      height: height / 2,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                CommonImages.demoWallpaper),
                                            fit: BoxFit.cover),
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.grey.shade800),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                            Colors.black.withOpacity(0.3),
                                            blurRadius: 10,
                                            spreadRadius: 8,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }),
                    ),
                  ),
                  Positioned(bottom: 10, left: 0, right: 0, child: Text("Move the Phone to See the effect", style: googleFontStyle(color: Colors.white), textAlign: TextAlign.center,),),
                ],
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => pointItem(point: points[i]),
                separatorBuilder: (context, i) => const SizedBox(
                      height: 10,
                    ),
                itemCount: points.length),


            const CommonShowCode(
              codeText: CodeText.accelerometerSensorCode,
            )
          ].addGap(const SizedBox(height: 20)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }
}

  ''';

  static const String gyroscopeSensorCode = '''
  
  import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:testing/utils/common_images.dart';
import 'package:testing/utils/constants.dart';
import 'package:testing/utils/extension_custom.dart';
import '../../utils/code_text.dart';
import '../../utils/common_widget_classes.dart';

class GyroscopeFlutter extends StatefulWidget {
  const GyroscopeFlutter({super.key});

  @override
  State<GyroscopeFlutter> createState() => _GyroscopeFlutterState();
}

class _GyroscopeFlutterState extends State<GyroscopeFlutter> {
  List points = [
    "Package : sensors_plus",
    "Gyroscopes measure the rate or rotation of the device in 3D space.",
    "Rate of rotation around the x, y and z axes measured in rad/s."
  ];

  late StreamSubscription _streamSubscription;
  double xAngle = 0.0;
  double yAngle = 0.0;
  double zAngle = 0.0;
  double width = 450;
  double height = 700;
  DateTime timeStamps = DateTime.now();

  @override
  void initState() {
    _streamSubscription = gyroscopeEventStream().listen(
      (GyroscopeEvent event) {
        setState(() {
          xAngle = event.x;
          timeStamps = event.timestamp;
          yAngle = double.parse(event.y.toString());
          zAngle = double.parse(event.z.toString());
        });
      },
      onError: (error) {
        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Gyroscope",
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.black),
              child: Column(
                children: [
                  Text(
                    "Rotate Velocity Z Axis",
                    style: googleFontStyle(color: Colors.white),
                  ),
                  Text(
                    zAngle.toString(),
                    style: googleFontStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 500,
              decoration: const BoxDecoration(color: Colors.black),
              child: Stack(
                children: [
                  AnimatedContainer(
                    // turns: -zAngle/(2*pi),
                    duration: const Duration(milliseconds: 100),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationZ(-zAngle),
                      // angle: -zAngle/(2*pi),
                      child: Center(
                          child: Container(
                        width: width / 2,
                        height: height / 2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(CommonImages.demoWallpaper),
                              fit: BoxFit.cover),
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey.shade800),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 8,
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Text(
                      "Move the Phone to See the effect",
                      style: googleFontStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => pointItem(point: points[i]),
                separatorBuilder: (context, i) => const SizedBox(
                      height: 10,
                    ),
                itemCount: points.length),
            const CommonShowCode(
              codeText: CodeText.gyroscopeSensorCode,
            )
          ].addGap(const SizedBox(height: 20)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }
}

  ''';

  static const String magnetometerSensorCode = '''
  
  import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:testing/utils/constants.dart';
import 'package:testing/utils/extension_custom.dart';
import '../../utils/code_text.dart';
import '../../utils/common_widget_classes.dart';
import 'dart:math';

class MagnetometerFlutter extends StatefulWidget {
  const MagnetometerFlutter({super.key});

  @override
  State<MagnetometerFlutter> createState() => _MagnetometerFlutterState();
}

class _MagnetometerFlutterState extends State<MagnetometerFlutter> {
  List points = [
    "Package : sensors_plus",
    "Magnetometers measure the ambient magnetic field surrounding the sensor, returning values in microteslas ***μT*** for each three-dimensional axis.",
  ];

  late StreamSubscription _streamSubscription;
  double xAngle = 0.0;
  double yAngle = 0.0;
  double zAngle = 0.0;
  double _magneticValue = 0.0;

  @override
  void initState() {
    _streamSubscription = magnetometerEventStream().listen(
      (MagnetometerEvent event) {
        final magneticField = sqrt(event.x*event.x + event.y*event.y + event.z*event.z);
        setState(() {
          _magneticValue = magneticField;
        });
      },
      onError: (error) {
        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Magnetometer",
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.black),
              child: Column(
                children: [
                  Text(
                    "Magnetic Value",
                    style: googleFontStyle(color: Colors.white),
                  ),
                  Text(
                    _magneticValue.toString(),
                    style: googleFontStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            _getRadialGauge(),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => pointItem(point: points[i]),
                separatorBuilder: (context, i) => const SizedBox(
                      height: 10,
                    ),
                itemCount: points.length),
            const CommonShowCode(
              codeText: CodeText.magnetometerSensorCode,
            )
          ].addGap(const SizedBox(height: 20)),
        ),
      ),
    );
  }

  Widget _getRadialGauge() {
    return SfRadialGauge(
        title: const GaugeTitle(
            text: 'MagnetoMeter',
            textStyle:
            TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 150,
              ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: 150,
                gradient: const SweepGradient(
                    colors: <Color>[Color(0xFFEDFAFF), Color(0xFF012DFF)],
                    stops: <double>[0.25, 0.75]),
                startWidth: 10,
                endWidth: 15),
          ], pointers: <GaugePointer>[
            NeedlePointer(value: _magneticValue)
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Text(_magneticValue.toStringAsFixed(0),
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold)),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }
}

  ''';

  static const String barometerSensorCode = '''
  
  import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:testing/utils/common_snackbar.dart';
import 'package:testing/utils/constants.dart';
import 'package:testing/utils/extension_custom.dart';
import '../../utils/code_text.dart';
import '../../utils/common_widget_classes.dart';

class BarometerFlutter extends StatefulWidget {
  const BarometerFlutter({super.key});

  @override
  State<BarometerFlutter> createState() => _BarometerFlutterState();
}

class _BarometerFlutterState extends State<BarometerFlutter> {
  List points = [
    "Package : sensors_plus",
    "Barometers measure the atmospheric pressure surrounding the sensor, returning values in hectopascals ***hPa***.",
  ];

  late StreamSubscription _streamSubscription;
  double _pressureValue = 0.0;

  @override
  void initState() {
    _streamSubscription = barometerEventStream().listen(
      (BarometerEvent event) {
        print(event.toString());
        setState(() {
          _pressureValue = event.pressure;
        });
      },
      onError: (error) {
        debugPrint(error.toString());

        if(error is PlatformException){
          CommonSnackbar.showError(context: context, message: error.details ?? '');
        }
      },
      cancelOnError: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Barometer",
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.black),
              child: Column(
                children: [
                  Text(
                    "Pressure Value",
                    style: googleFontStyle(color: Colors.white),
                  ),
                  Text(
                    _pressureValue.toString(),
                    style: googleFontStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            _getRadialGauge(),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => pointItem(point: points[i]),
                separatorBuilder: (context, i) => const SizedBox(
                      height: 10,
                    ),
                itemCount: points.length),
            const CommonShowCode(
              codeText: CodeText.barometerSensorCode,
            )
          ].addGap(const SizedBox(height: 20)),
        ),
      ),
    );
  }

  Widget _getRadialGauge() {
    return SfRadialGauge(
        title: const GaugeTitle(
            text: 'Barometer(hPa)',
            textStyle:
            TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 900, maximum: 1100,
              ranges: <GaugeRange>[
            GaugeRange(
                startValue: 900,
                endValue: 1100,
                gradient: const SweepGradient(
                    colors: <Color>[Color(0xFFEDFAFF), Color(0xFF012DFF)],
                    stops: <double>[0.25, 0.75]),
                startWidth: 10,
                endWidth: 15),
          ], pointers: <GaugePointer>[
            NeedlePointer(value: _pressureValue)
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Text(_pressureValue.toStringAsFixed(0),
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold)),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }
}

  ''';

  static const String inactivityTrackingCode = '''
  
  //----------------------------welcome_inactivity_tracking.dart------------------------------>
  
  
  import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/features/inactivity_tracking/login_inactivity_tracking.dart';
import 'package:testing/utils/constants.dart';

class WelcomeInactivityTracking extends StatefulWidget {
  const WelcomeInactivityTracking({super.key});

  @override
  State<WelcomeInactivityTracking> createState() => _WelcomeInactivityTrackingState();
}

class _WelcomeInactivityTrackingState extends State<WelcomeInactivityTracking> with WidgetsBindingObserver {

  Timer? inactivityTimer;
  final Duration inactivityDuration = const Duration(seconds: 15);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  void _startBackgroundTimer(){
    debugPrint("_startBackgroundTimer called");
    inactivityTimer?.cancel();
    inactivityTimer = Timer(inactivityDuration, _onBackgroundInactivityDetected);
  }

  void _cancelBackgroundTimer(){
    debugPrint("_cancelBackgroundTimer called");
    inactivityTimer?.cancel();
  }

  void _onBackgroundInactivityDetected(){
    // do logout and send to welcome screen
    Get.until((route) => route.settings.name == '/WelcomeInactivityTracking');
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Inactivity Detected', style: googleFontStyle(),),
        content: Text('You have been inactive for \${inactivityDuration.inSeconds} seconds. Please Login again to Continue.', style: googleFontStyle(),),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('OK', style: googleFontStyle(),),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    inactivityTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    // if(state == AppLifecycleState.paused){
    //   _startBackgroundTimer();
    // }else
    if(state == AppLifecycleState.resumed){
      _startBackgroundTimer();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _startBackgroundTimer,      // Reset timer on taps
      onPanUpdate: (_) => _startBackgroundTimer(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.lightBlueAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome!',
                style: googleFontStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Let\'s get started.',
                style: googleFontStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Get.to(LoginInactivityTracking());
                  _startBackgroundTimer();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue, backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: googleFontStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



  ''';
}
