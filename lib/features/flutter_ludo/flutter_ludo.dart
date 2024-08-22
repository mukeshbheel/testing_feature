import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:testing/features/flutter_ludo/ludo_controller/ludo_controller.dart';
import 'package:testing/features/flutter_ludo/ludo_piece.dart';
import 'package:testing/utils/common_button.dart';

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

  @override
  initState() {
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      ludoController.initState();
    });
    super.initState();
  }

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
              // Text('steps : ${ludoController.steps.value}'),

              SizedBox(height: 30,),
              if(ludoController.firstPlace.value != 0)
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [

                    if(ludoController.firstPlace.value != 0)
                      Text("First Place : Player ${ludoController.firstPlace()}", style: googleFontStyle(fontSize: 18, color: Colors.white,),),

                    if(ludoController.secondPlace.value != 0)
                      Text("Second Place : Player ${ludoController.secondPlace()}", style: googleFontStyle(fontSize: 18, color: Colors.white,),),

                    if(ludoController.thirdPlace.value != 0)
                      Text("Third Place : Player ${ludoController.thirdPlace()}", style: googleFontStyle(fontSize: 18, color: Colors.white,),),

                    if(ludoController.thirdPlace.value != 0)
                      Text("Fourth Place : Player ${ludoController.fourthPlace()}", style: googleFontStyle(fontSize: 18, color: Colors.white,),),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("${ludoController.getPlayerTurnName()} Player's Turn", style: googleFontStyle(fontSize: 18, color: getButtomColor(ludoController.currentPlayerTurn.value),),),
              ),
              SizedBox(height: 30,),
              Center(
                  child: Wrap(
                children: [
                  ...List.generate(225, (i) {
                    var token = ludoController.getToken(i);
                    return Container(
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
                            ? InkWell(
                                onTap: () {
                                  if (ludoController.steps.value == 0) return;
                                  ludoController.moveToken(
                                    token: token,
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Icon(
                                    Icons.token,
                                    size: 16,
                                    color: ludoController.getTokenColor(token['color']),
                                  ),
                                ),
                              )
                            : Text(
                          !showPositions ?
                            ""
                                :"${i+1}", style: googleFontStyle(fontSize: 8),
                                ),
                      ),
                    );
                  })
                ],
              )),
              SizedBox(height: 30),
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
                            child: Image.asset("assets/dice_${ludoController.diceNumber.value}.png"),
                          ),
                        ),
                      ),
              SizedBox(
                height: 30,
              ),
              if(ludoController.steps.value == 0)
              SizedBox(
                width: 100,
                child: CommonButton.mainButton(
                    text: "Roll Dice",
                    colorBg: getButtomColor(ludoController.currentPlayerTurn.value),
                    onTap: () {
                      ludoController.rollDice();
                    }),
              ),
              
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
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
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                          Text("Token : ", style: googleFontStyle(color: Colors.white),),
                          PopupMenuButton(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.black
                              ),
                              child: Text(selectedToken.isNotEmpty ? "${selectedToken['id']}"  :'select token', style: googleFontStyle(color: Colors.white),),
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
                                  child: Text('${ludoController.allTokens[index]['id']} - ${ludoController.allTokens[index]['color']} - Current Position : ${ludoController.allTokens[index]['position']}'),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                          Text("Position : ", style: googleFontStyle(color: Colors.white),),
                          PopupMenuButton(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.black
                              ),
                              child: Text(selectedPosition != 0 ? "${selectedPosition}"  :'select position', style: googleFontStyle(color: Colors.white),),
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
                                  child: Text('${index+1}'),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                    CommonButton.mainButton(text: "set position",onTap: (){
                      debugPrint("$selectedToken");
                      debugPrint("$selectedPosition");
                      ludoController.setTokenPosition(token: selectedToken, newPosition: selectedPosition);
                      setState(() {});
                    }),

                  ],
                ),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
        ),
      ),
    );
  }
}

Color getButtomColor(int i){
  if(i == 1)return Colors.red;
  if(i == 2)return Colors.green;
  if(i == 3)return Colors.yellow;
  if(i == 4)return Colors.blue;
  return Colors.black;
}
