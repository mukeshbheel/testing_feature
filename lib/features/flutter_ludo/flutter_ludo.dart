import 'package:flutter/material.dart';

import '../../utils/constants.dart';

const String color00 = "firstColorLight";
const String color01 = "firstColor";
const String color02 = "firstColorDark";

const String color10 = "secondColorLight";
const String color11 = "secondColor";
const String color12 = "secondColorDark";

const String color20 = "thirdColorLight";
const String color21 = "thirdColor";
const String color22 = "thirdColorDark";

const String color30 = "forthColorLight";
const String color31 = "forthColor";
const String color32 = "forthColorDark";

const String colorWh = "whiteColor";
const String colorBl = "blackColor";


class FlutterLudo extends StatelessWidget {
  FlutterLudo({super.key});

  List<List<String>> gridState = [
  [color00, color00, color00, color00, color00, color00, colorWh, colorWh, colorWh, color10, color10, color10, color10, color10, color10],
  [color00, color01, color01, color01, color01, color00, colorWh, color11, color11, color10, color11, color11, color11, color11, color10],
  [color00, color01, color02, color02, color01, color00, colorBl, color11, colorWh, color10, color11, color12, color12, color11, color10],
  [color00, color01, color02, color02, color01, color00, colorWh, color11, colorWh, color10, color11, color12, color12, color11, color10],
  [color00, color01, color01, color01, color01, color00, colorWh, color11, colorWh, color10, color11, color11, color11, color11, color10],
  [color00, color00, color00, color00, color00, color00, colorWh, color11, colorWh, color10, color10, color10, color10, color10, color10],
  [colorWh, color01, colorWh, colorWh, colorWh, colorWh, colorBl, colorBl, colorBl, colorWh, colorWh, colorWh, colorBl, colorWh, colorWh],
  [colorWh, color01, color01, color01, color01, color01, colorBl, colorBl, colorBl, color31, color31, color31, color31, color31, colorWh],
  [colorWh, colorWh, colorBl, colorWh, colorWh, colorWh, colorBl, colorBl, colorBl, colorWh, colorWh, colorWh, colorWh, color31, colorWh],
  [color20, color20, color20, color20, color20, color20, colorWh, color21, colorWh, color30, color30, color30, color30, color30, color30],
  [color20, color21, color21, color21, color21, color20, colorWh, color21, colorWh, color30, color31, color31, color31, color31, color30],
  [color20, color21, color22, color22, color21, color20, colorWh, color21, colorWh, color30, color31, color32, color32, color31, color30],
  [color20, color21, color22, color22, color21, color20, colorWh, color21, colorBl, color30, color31, color32, color32, color31, color30],
  [color20, color21, color21, color21, color21, color20, color21, color21, colorWh, color30, color31, color31, color31, color31, color30],
  [color20, color20, color20, color20, color20, color20, colorWh, colorWh, colorWh, color30, color30, color30, color30, color30, color30],
  ];

  Widget _buildGameBody(BuildContext context) {
    int gridStateLength = gridState.length;
    return Column(
      mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  // border: Border.all(color: Colors.black, width: 2.0)
              ),
              child: Stack(
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: gridStateLength,
                    ),
                    itemBuilder: _buildGridItems,
                    itemCount: gridStateLength * gridStateLength,
                  ),
                  Positioned(
                    top: (MediaQuery.of(context).size.width/15)*7,
                    left: (MediaQuery.of(context).size.width/15)*2,
                    child: Container(
                      width: MediaQuery.of(context).size.width/15,
                      height: MediaQuery.of(context).size.width/15,
                      color: Colors.grey.withOpacity(0.2),
                      child: const Icon(Icons.gas_meter, color: Colors.purple, size: 15,),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]);
  }

  Widget _buildGridItems(BuildContext context, int index) {
    int gridStateLength = gridState.length;
    int x, y = 0;
    x = (index / gridStateLength).floor();
    y = (index % gridStateLength);
    return GestureDetector(
      // onTap: () => _gridItemTapped(x, y),
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)
          ),
          child: Center(
            child: _buildGridItem(x, y),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(int x, int y) {
    switch (gridState[x][y]) {
      case color00:
        return Container(
          color: Colors.greenAccent,
        );
      case color01:
        return Container(
          color: Colors.green,
        );
      case color02:
        return Container(
          color: const Color(0xff143325),
        );

      case color10:
        return Container(
          color: Colors.yellowAccent,
        );
      case color11:
        return Container(
          color: Colors.yellow,
        );
      case color12:
        return Container(
          color: const Color(0xffDA8528),
        );

      case color20:
        return Container(
          color: Colors.redAccent,
        );
      case color21:
        return Container(
          color: Colors.red,
        );
      case color22:
        return Container(
          color: const Color(0xff8A2214),
        );

      case color30:
        return Container(
          color: Colors.blueAccent,
        );
      case color31:
        return Container(
          color: Colors.blue,
        );
      case color32:
        return Container(
          color: const Color(0xff0A122D),
        );

      case colorWh:
        return Container(
          color: Colors.white,
        );

      case colorBl:
        return Container(
          color: Colors.black,
        );
      default:
        return Text(gridState[x][y].toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Flutter Ludo',
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              _buildGameBody(context),
            ],
          ),
        ),
      ),
    );
  }
}
