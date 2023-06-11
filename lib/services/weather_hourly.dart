import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/storage/api_key.dart';

//Отримання API щоденної погоди з сайту
class WeatherApiHourlyClient {
  Future<List> getHourlyWeather(String? location) async {
    String key = ApiKey.apiKey;
    var endpoint = Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$location&appid=$key&units=metric');
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return body['list'];
  }
}