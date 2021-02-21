import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';



const apiKey = 'f1dd65cd893c4c893f235081e61a5b82';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();

  }

  void getLocationData () async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();



  }



  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}


// body: Center(
// child: RaisedButton(
// onPressed: () {
// getLocation();
// //Get the current location
// },
// child: Text('Get Location'),
// ),
// ),