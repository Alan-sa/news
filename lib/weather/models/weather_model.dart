class WeatherResponse {
  final double latitude;
  final double longitude;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentUnits currentUnits;
  final Current current;

  WeatherResponse(
      {required this.latitude,
      required this.longitude,
      required this.timezone,
      required this.timezoneAbbreviation,
      required this.elevation,
      required this.currentUnits,
      required this.current});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      latitude: json['latitude'],
      longitude: json['longitude'],
      timezone: json['timezone'],
      timezoneAbbreviation: json['timezone_abbreviation'],
      elevation: json['elevation'],
      currentUnits: CurrentUnits.fromJson(json['current_units']),
      current: Current.fromJson(json['current']),
    );
  }
}

class CurrentUnits {
  final String time;
  final String interval;
  final String temperature2m;
  final String windSpeed10m;

  CurrentUnits(
      {required this.time,
      required this.interval,
      required this.temperature2m,
      required this.windSpeed10m});

  factory CurrentUnits.fromJson(Map<String, dynamic> json) {
    return CurrentUnits(
      time: json['time'],
      interval: json['interval'],
      temperature2m: json['temperature_2m'],
      windSpeed10m: json['wind_speed_10m'],
    );
  }
}

class Current {
  final String time;
  final int interval;
  final double temperature2m;
  final double windSpeed10m;

  Current(
      {required this.time,
      required this.interval,
      required this.temperature2m,
      required this.windSpeed10m});

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      time: json['time'],
      interval: json['interval'],
      temperature2m: json['temperature_2m'],
      windSpeed10m: json['wind_speed_10m'],
    );
  }
}
