import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/services/weather_api_client.dart';
import 'package:weather_app/storage/weather_model.dart';
import 'package:weather_app/widgets/additional_information.dart';
import 'package:weather_app/widgets/current_weather.dart';
import 'package:weather_app/widgets/google_sign_in.dart';
import 'package:weather_app/widgets/listview_daily.dart';
import 'package:weather_app/widgets/side_menu.dart';
import 'package:weather_app/services/weather_hourly.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: const MaterialApp(
        home: HomePage()
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String location = 'Kyiv';

  Weather data = Weather();
  List<dynamic>? dataHourly;

  Future<void> getData() async {
    data = await WeatherApiClient().getCurrentWeather(location);
  }

  Future<void> getDataHourly() async {
    dataHourly = await WeatherApiHourlyClient().getHourlyWeather(location);
  }

  void updateLocation(String city) {
    setState(() {
      location = city;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavDrawer(
        cityPass: (String cityName) {
          updateLocation(cityName);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: const Text("Weather App", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0,),
          child: FutureBuilder(
            future: Future.wait([getData(), getDataHourly()]),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done) {
               return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      currentWeather('http://openweathermap.org/img/w/${data.icon}.png', data.temp, '${data.cityName}'),
                      const SizedBox(height: 50.0),
                      Text(
                        'Additional information',
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.grey[850],
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const Divider(),
                      const SizedBox(height: 10.0,),
                      additionalInformation('${data.wind}', '${data.humidity}', '${data.pressure}', data.feelsLike),
                      const SizedBox(height: 40.0,),
                      hourlyWeather(dataHourly!),
                    ]);
              } else if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return Container();
            }),
        ),
    );
  }
}
