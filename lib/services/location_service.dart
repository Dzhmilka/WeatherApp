import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/storage/api_key.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationService {
  final String key = ApiKey.apiKey;

  Future<String> getPlaceID (LatLng coordinates) async {
    final String url = 'http://api.openweathermap.org/geo/1.0/reverse?lat=${coordinates.latitude}&lon=${coordinates.longitude}&limit=1&appid=$key';
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var cityName = json[0]['name'];
    return cityName;
  }
}