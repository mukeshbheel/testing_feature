import 'dart:math';

main(){
  List arr1 = [0,1,0,2,1,0,1,3,2,1,2,1];
  List arr2 = [3,0,0,2,0,4];
  List arr3 = [4,2,0,3,2,5];
  List arr4 = [0,1,0,2,1,0,1,3,2,3,2,1];

  print('total water calculated : ${ trapWaterWell(arr1)}');
  print('total water calculated : ${ trapWaterWell(arr2)}');
  print('total water calculated : ${ trapWaterWell(arr3)}');
  print('total water calculated : ${ trapWaterWell(arr4)}');

}

int trapWaterWell(List arr){
  int total = 0;
  int maxHeightIndex = getMaxHeightIndex(arr);
  int startIndex = getStartingIndex(arr);
  int endIndex = getEndingIndex(arr);

  //start section for loop
  for(int i = startIndex; i < arr.length; i++){
    if(arr[i] > arr[startIndex]){
      total += calculateWater(arr, startIndex, i);
      startIndex = i;
    }

    if(arr[i] == arr[maxHeightIndex]){
      startIndex = i;
      break;
    }
  }
  // print("after start section calculation : $total");

  //end section for loop
  for(int i = endIndex; i >= 0; i--){
    if(arr[i] > arr[endIndex]){
      total += calculateWater(arr, i, endIndex);
      endIndex = i;
    }

    if(arr[i] == arr[maxHeightIndex]){
      break;
    }
  }
  // print("after end section calculation : $total");


  //mid section calculation
  if(startIndex != endIndex) {
    total += calculateWater(arr, startIndex, endIndex);
  }
  // print("after mid section calculation : $total");

  return total;
}

int calculateWater(List arr, int startIndex, int endIndex){
  int height = min(arr[startIndex], arr[endIndex]);
  int  total = 0;
  for(int i = startIndex; i < endIndex; i++){
    num blocks = height - arr[i];
    total += blocks < 0 ? 0 : (blocks as int);
  }
  return total;
}

int getMaxHeightIndex(List arr){
  int max = 0;
  for(int i = 0; i < arr.length; i++ ){
    if(arr[i] > arr[max]){
      max = i;
    }
  }
  return max;
}

int getStartingIndex(List arr){
  int startIndex = 0;
  for(int i = 0; i < arr.length; i++ ){
    if(arr[i] > 0){
      startIndex = i;
      break;
    }
  }
  return startIndex;
}

int getEndingIndex(List arr){
  int endIndex = arr.length-1;
  for(int i = arr.length-1; i >= 0; i-- ){
    if(arr[i] > 0){
      endIndex = i;
      break;
    }
  }
  return endIndex;
}