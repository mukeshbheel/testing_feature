import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:testing/features/flutter_ludo/ludo_controller/ludo_controller.dart';
import 'package:testing/features/flutter_ludo/ludo_piece.dart';
import 'package:testing/utils/common_button.dart';

import '../../utils/constants.dart';



//--------------green pieces----------------->
LudoPiece? green1;


class FlutterLudo extends StatefulWidget {
  FlutterLudo({super.key});

  @override
  State<FlutterLudo> createState() => _FlutterLudoState();
}

class _FlutterLudoState extends State<FlutterLudo> {
  final ludoController = LudoController();

  @override
  initState(){
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp){

      ludoController.initState();
    });
    super.initState();
  }

  List<int> lightGreenColorBox = [1,2,3,4,5,6,16,21,31,36,46,51,61,66,16,76,77,78,79,80,81];
  List<int> greenColorBox = [17,18,19,20,32,35,47,50,62,63,64,65,92,107,108,109,110,111];

  List<int> lightYellowColorBox = [10,11,12,13,14,15,25,30,40,45,55,60,70,75,85,86,87,88,89,90];
  List<int> yellowColorBox = [26,27,28,29,41,44,56,59,71,72,73,74,23,24,38,53,68,83];

  List<int> lightRedColorBox = [136,137,138,139,140,141,151,156,166,171,181,186,196,201,211,212,213,214,215,216];
  List<int> redColorBox = [152,153,154,155,167,170,182,185,197,198,199,200,202,203,143,158,173,188];
  List<int> redTokenBase = [168,169,183,184];

  List<int> lightBlueColorBox = [145,146,147,148,149,150,160,165,175,180,190,195,205,210,220,221,222,223,224,225];
  List<int> blueColorBox = [161,162,163,164,176,179,191,194,206,207,208,209,115,116,117,118,119,134];

  List<int> greyColorBox = [97,98,99,112,113,114,127,128,129,189,123,37,103];

  Color getColor(int i){
    if(lightGreenColorBox.contains(i+1))return Colors.greenAccent;
    else if(greenColorBox.contains(i+1))return Colors.green;
    else if(lightYellowColorBox.contains(i+1))return Colors.yellowAccent;
    else if(yellowColorBox.contains(i+1))return Colors.yellow;
    else if(yellowColorBox.contains(i+1))return Colors.yellow;
    else if(lightRedColorBox.contains(i+1))return Colors.redAccent;
    else if(redColorBox.contains(i+1))return Colors.red;
    else if(lightBlueColorBox.contains(i+1))return Colors.blueAccent;
    else if(blueColorBox.contains(i+1))return Colors.blue;
    else if(greyColorBox.contains(i+1))return Colors.grey;
    return Colors.white;
  }

  Color getTokenColor(String color){
    switch(color){
      case "green":
        return Colors.green;
      case "red":
        return Colors.red;
      case "blue":
        return Colors.blue;
      case "yellow":
        return Colors.yellow;
      default:
        return Colors.white;
    }
  }

  List allTokens = [
    {
      "id" : 1,
      "color":"green",
      "position":33
    },
    {
      "id" : 2,
      "color":"green",
      "position":34
    },
    {
      "id" : 3,
      "color":"green",
      "position":48
    },
    {
      "id" : 4,
      "color":"green",
      "position":49
    },


    {
      "id" : 5,
      "color":"yellow",
      "position":42
    },
    {
      "id" : 6,
      "color":"yellow",
      "position":43
    },
    {
      "id" : 7,
      "color":"yellow",
      "position":57
    },
    {
      "id" : 8,
      "color":"yellow",
      "position":58
    },


    {
      "id" : 9,
      "color":"red",
      "position":168
    },
    {
      "id" : 10,
      "color":"red",
      "position":169
    },
    {
      "id" : 11,
      "color":"red",
      "position":183
    },
    {
      "id" : 12,
      "color":"red",
      "position":184
    },



    {
      "id" : 13,
      "color":"blue",
      "position":177
    },
    {
      "id" : 14,
      "color":"blue",
      "position":178
    },
    {
      "id" : 15,
      "color":"blue",
      "position":192
    },
    {
      "id" : 16,
      "color":"blue",
      "position":193
    },
  ];

  List pathForRed = [202,187,172,157,142,126,125,124,123,122,121,106,91,92,93,94,95,96,82,67,52,37,22,7,8,9,24,39,54,69,84,100,101,102,103,104,105,120,135,134,133,132,131,130,144,159,174,189,204,219,218,203,188,173,158,143,0];

  moveToken({required Map token, required int steps}){
    int index = allTokens.indexWhere((t)=>t["id"] == token['id']);
    if(token['color'] == "red"){
      if(redTokenBase.contains(token['position'])){
        if(steps == 6){
          setState(() {
            allTokens[index] = {
              ...token,
              "position":pathForRed[0]
            };
            steps = 0;
          });
        }
      }else{
        int pathIndex = pathForRed.indexOf(token['position']);
        int newPositionIndex = pathIndex + steps;
        if(newPositionIndex < pathForRed.length){
          setState(() {
            allTokens[index] = {
              ...token,
              "position":pathForRed[newPositionIndex]
            };
            steps = 0;
          });
        }

      }
    }
  }

  getToken(i){
    int index = allTokens.indexWhere((token)=>token['position'] == (i+1));
    if(index != -1){
      return allTokens[index];
    }
  }

   int getRandomNumber(){
     Random random = new Random();
     int randomNumber = random.nextInt(6);
     return randomNumber + 1;
  }

  bool diceIsRolling = false;
  int steps = 0;

  rollDice()async{
    setState(() {
      diceIsRolling = true;
    });
    await Future.delayed(Duration(seconds: 1),(){
      setState(() {
        steps = getRandomNumber();
        diceIsRolling = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ludoController,
        builder: (_)=>Scaffold(
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
      // Obx(
      //         ()=>
                  SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Wrap(
                children: [
                  ...List.generate(225, (i){
                    var token = getToken(i);
                    return Container(
                      width: Get.size.width/15,
                      height: Get.size.width/15,
                      decoration: BoxDecoration(
                        color: getColor(i),
                        border: Border.all(color: Colors.black.withOpacity(0.1), width: 0.5)
                      ),
                      child: Center(
                        child: token != null ? InkWell(
                          onTap: (){
                            if(steps == 0)return;
                            moveToken(token: token, steps: steps);
                          },
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                            ),
                              child: Icon(Icons.token, size: 16, color: getTokenColor(token['color'],),
                              ),
                          ),
                        ) : Text(
                          ""
                          // "${i+1}"
                        ),
                      ),
                    );
                  })
                ],
              )
            ),
            SizedBox(height: 30,),
            if(steps != 0 || diceIsRolling)
            SizedBox(width: 100, child: diceIsRolling ? Lottie.asset( "assets/dice_roll_gif.json"): Image.asset( "assets/dice_${steps}.png"),),
            SizedBox(height: 30,),
            SizedBox(width: 100, child: CommonButton.mainButton(text: "Roll Dice", onTap: (){
              rollDice();
            }),)
          ],
        ),
      ),
      // ),
    )
    );
  }
}
