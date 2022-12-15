import 'package:flutter/material.dart';

//Основна інформація
Widget currentWeather(String icon, double? temp, String location){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.blue[400],
        child: Image.network(icon),
      ),
      SizedBox(height: 10.0),
      Text(
        '${temp?.round()}°C',
        style: TextStyle(
          fontSize: 46.0
        ),
      ),
      SizedBox(height: 10.0),
      Text(
        location,
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.grey[700]
        ),
      )
    ]);
}