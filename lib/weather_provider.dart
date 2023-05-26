import 'package:flutter/material.dart';
import 'package:weather_app/weather_api.dart';
import 'package:weather_app/weather_model.dart';

class WeatherProvider extends ChangeNotifier
{
  Future<WeatherModel> loadDatas()
  async {
    return await Weather_API.weather_api.get_weather_api();
  }
}