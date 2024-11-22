import 'package:flutter/services.dart';

class SensorsUtils{
  static const MethodChannel _channel = MethodChannel("sensor_utils");

  static Future<bool> isSensorAvailable(String sensorType) async{
    try{
      final bool isAvailable = await _channel.invokeMethod(
        'isSensorAvailable',
        {'sensorType' : sensorType}
      );
      return isAvailable;
    }catch(e){
      print("Error checking sensor availability: $e");
      return false;
    }
  }
}