import 'package:flutter/material.dart';
import 'package:news_learning/weather/services/weather_service.dart';
import '../models/weather_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/weather_data_representation.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<WeatherResponse> futureWeatherData;

  @override
  void initState() {
    super.initState();
    futureWeatherData = fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Weather',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<WeatherResponse>(
        future: futureWeatherData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WeatherResponse weatherData = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //create a row widget
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WeatherDataRepresentation(
                          title: 'Location',
                          data:
                              '${weatherData.latitude}, ${weatherData.longitude}'),
                      WeatherDataRepresentation(
                          title: 'Timezone',
                          data:
                              '${weatherData.timezone}, ${weatherData.timezoneAbbreviation}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WeatherDataRepresentation(
                          title: 'Elevation', data: '${weatherData.elevation}'),
                      WeatherDataRepresentation(
                          title: 'Time', data: '${weatherData.current.time}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WeatherDataRepresentation(
                          title: 'Temperature',
                          data:
                              '${weatherData.current.temperature2m} ${weatherData.currentUnits.temperature2m}'),
                      WeatherDataRepresentation(
                          title: 'Wind Speed',
                          data:
                              '${weatherData.current.windSpeed10m} ${weatherData.currentUnits.windSpeed10m}'),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MapSample(),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(-34.0, 151.0), // Example location (Sydney, Australia)
          zoom: 10,
        ),
      ),
    );
  }
}
