// gps_home_page.dart

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GPSHomePage extends StatefulWidget {
  @override
  _GPSHomePageState createState() => _GPSHomePageState();
}

class _GPSHomePageState extends State<GPSHomePage> {
  String _locationMessage = "";

  void _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _locationMessage = "Location permissions are permanently denied.";
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _locationMessage =
          "Lat: ${position.latitude}, Long: ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPS Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your Location:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              _locationMessage,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getCurrentLocation,
              child: Text('Get Current Location'),
            ),
          ],
        ),
      ),
    );
  }
}
