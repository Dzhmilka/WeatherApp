import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/storage/weather_model.dart';
import 'package:weather_app/storage/api_key.dart';

//Отримання API з сайту
class WeatherApiClient {
  Future<Weather> getCurrentWeather(String? location) async {
    String key = ApiKey.apiKey;
    var endpoint = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$key&units=metric');
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return Weather.fromJSON(body);
  }
}