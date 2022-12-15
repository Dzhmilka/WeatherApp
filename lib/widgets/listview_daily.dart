import 'package:flutter/material.dart';

Widget hourlyWeather (List<dynamic> weatherList) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Container(
      height: 130.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 130.0,
            width: 80.0,
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(12.0)
            ),
            margin: EdgeInsets.only(right: 10.0),
            child: HourlyDetails(
              temp: weatherList[index]['main']['temp'],
              time: weatherList[index]['dt_txt'],
              icon: weatherList[index]['weather'][0]['icon'],
            ),
          );
        },
      ),
    ),
  );
}

class HourlyDetails extends StatelessWidget {
  double temp;
  String time;
  String icon;

  HourlyDetails({Key? key, required this.temp, required this.time, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: Text(time, textAlign: TextAlign.center),
        ),
        SizedBox(height: 15.0,),
        Image.network('http://openweathermap.org/img/w/$icon.png'),
        Text('${temp.round()}°C')
      ],
    );
  }
}
