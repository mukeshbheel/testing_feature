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
    debugPrint("getPlayerColor() != token['color'] : ${getPlayerColor() != token['color']}");
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
          debugPrint("itemsAtPosition : $itemsAtPosition");
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
        debugPrint("${allTokens.value[i]}");
        count++;
        int positionIndex = currentPlayerPath.indexOf(allTokens.value[i]['position']);
        debugPrint("count : $count");
        // debugPrint("count : ${count}");
        debugPrint("positionIndex : $positionIndex");
        debugPrint("steps : $steps");
        // debugPrint("count : ${count}");
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