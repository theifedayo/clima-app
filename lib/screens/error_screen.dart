import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class ErrorScreen extends StatefulWidget {
  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
          child: Text(
              '505 Error'
          ),
        )
        ]
      )
    );
  }
}

// double temperature = decodeData['main']['temp'];
// int condition = decodeData['weather'][0]['id'];
// String cityName = decodeData(data)['name'];
