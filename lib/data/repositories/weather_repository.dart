import 'dart:convert';

import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository({required this.weatherDataProvider});

  Future<WeatherModel> getCurrentWeather(String cityName) async {
    try {
      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] == 200) {
        return WeatherModel.fromJson(data);
      }

      throw data['message'] ?? "Something went wrong";
    } catch (e) {
      throw e.toString();
    }
  }
}
