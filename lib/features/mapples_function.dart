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
                      "Position: ${location.position.toString()}, Speed: ${location.speed}, Altitude: ${location.altitude}")
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
