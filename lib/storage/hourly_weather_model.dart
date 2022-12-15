class HourlyWeather {
  double? temp;
  String? icon;
  String? date;

  HourlyWeather({
    this.temp,
    this.icon,
    this.date
  });

  HourlyWeather.fromJSON(Map<String, dynamic> json) {
    // temp = json['main']['temp'];
    // icon = json['wind']['speed'];
    // date = json['main']['pressure'];
  }
}