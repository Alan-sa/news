import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_learning/weather/models/weather_model.dart';

Future<WeatherResponse> fetchWeatherData() async {
  final response = await http.get(Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=20.6413807&longitude=-100.3585789&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m'));

  if (response.statusCode == 200) {
    return WeatherResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load weather data');
  }
}
