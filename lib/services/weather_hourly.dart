import 'dart:convert';
import 'package:http/http.dart' as http;

//Отримання API щоденної погоди з сайту
class WeatherApiHourlyClient {
  Future<List> getHourlyWeather(String? location) async {
    String key = '37cbaed560a830cfa0f97df806cf4f75';
    var endpoint = Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$location&appid=$key&units=metric');
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return body['list'];
  }
}