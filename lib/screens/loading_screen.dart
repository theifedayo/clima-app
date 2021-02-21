import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'error_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



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
    print('loading.......');
    try{
      Location location = Location();
      await location.getCurrentLocation();

      latitude = location.latitude;
      longitude = location.longitude;

      NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

      var weatherData = await networkHelper.getData();
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return LocationScreen();
      }));
    }catch(e){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return ErrorScreen();
      }));
    }


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 30.0
        ),
      )
    );
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