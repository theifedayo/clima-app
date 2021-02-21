import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final apiKey = 'f1dd65cd893c4c893f235081e61a5b82';
  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  void getLocation () async {
    Location location = Location();
    await location.getCurrentLocation();
  }

  void getData() async {
    try{
      http.Response response = await http.get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
      if (response.statusCode == 200){
        String data = response.body;

        double temperature = jsonDecode(data)['main']['temp'];
        int condition = jsonDecode(data)['weather'][0]['id'];
        String cityName = jsonDecode(data)['name'];

        print(cityName);


      }else{
        print(response.statusCode);
      }
    }catch(e){
      print('bad connection');
    }


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