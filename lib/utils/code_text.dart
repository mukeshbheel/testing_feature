class CodeText{
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
      final result = platform.invokeMethod<int>("getBatteryLevel");
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
}