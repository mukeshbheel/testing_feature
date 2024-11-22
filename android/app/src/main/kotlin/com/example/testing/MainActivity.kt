package com.example.testing

import android.hardware.Sensor
import android.hardware.SensorManager
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "battery_channel"
    private val CHANNEL_SENSOR = "sensor_utils"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        var methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)

        methodChannel.setMethodCallHandler { call, result ->
            if(call.method == "getBatteryLevel"){
                val batterylevel = getBatteryLevel()

                if(batterylevel != -1){
                    result.success(batterylevel);
                }else{
                    result.error("UNAVAILABLE", "Battery level not available", null)
                }
            }else{
                result.notImplemented()
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_SENSOR).setMethodCallHandler { call, result ->
            if (call.method == "isSensorAvailable") {
                val sensorType = call.argument<String>("sensorType")
                val sensorManager = getSystemService(SENSOR_SERVICE) as SensorManager

                val sensor: Sensor? = when (sensorType) {
                    "STEP_COUNTER" -> sensorManager.getDefaultSensor(Sensor.TYPE_STEP_COUNTER)
                    "STEP_DETECTOR" -> sensorManager.getDefaultSensor(Sensor.TYPE_STEP_DETECTOR)
                    else -> null
                }

                result.success(sensor != null)
            } else {
                result.notImplemented()
            }
        }
    }

    private  fun getBatteryLevel(): Int{
        var batteryLevel : Int
        if(VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP){
            val batteryManager = getSystemService(BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        }else{
            val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)*100/intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }
        return batteryLevel
    }

}
