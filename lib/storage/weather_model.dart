//Отримання інформації з API
class Weather {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feelsLike;
  int? pressure;
  String? icon;

  Weather({
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.feelsLike,
    this.pressure,
    this.icon,
  });

  Weather.fromJSON(Map<String, dynamic> json) {
    cityName = json['name'];
    temp = json['main']['temp'];
    wind = json['wind']['speed'];
    pressure = json['main']['pressure'];
    humidity = json['main']['humidity'];
    feelsLike = json['main']['feels_like'];
    icon = json['weather'][0]['icon'];
  }
}