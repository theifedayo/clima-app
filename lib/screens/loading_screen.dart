import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/weather.dart';
import 'location_screen.dart';
import 'error_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';





class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  // double latitude;
  // double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();

  }

  void getLocationData () async {
    print('loading.......');
    try{
      WeatherModel weatherModel = WeatherModel();
      var weatherData = await weatherModel.getLocationWeather();
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return LocationScreen(locationWeather: weatherData);
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SpinKitRing(
              color: Colors.white,
              size: 60.0
            ),
          ),
          SizedBox(height: 20.0,),
          Text('Loading....')
        ],
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