import 'package:flutter/material.dart';
import 'package:weather_app/weather_api.dart';
import 'package:weather_app/model/weather_model.dart';

import 'model/citiesModel.dart';

class WeatherProvider extends ChangeNotifier
{
  Future<WeatherModel> loadDatas()
  async {
    return await Weather_API.weather_api.get_weather_api();
  }

  List<CityModel> cities = [
    CityModel(lat:21.1702 ,long: 72.8311,cityname: "Surat"),
    CityModel(lat:34.2268 ,long: 77.5619,cityname: "Ladakh"),
    CityModel(lat:26.1158 ,long: 91.7086,cityname: "Guwahati"),
    CityModel(lat:8.0844 ,long: 77.5495,cityname: "KanyaKumari"),
    CityModel(lat:17.3850 ,long: 78.4867,cityname: "Hyderabad"),
    CityModel(lat:11.6234,long: 92.7265,cityname: "Port Blair"),
    CityModel(lat:28.7041 ,long: 77.1025,cityname: "Delhi"),
  ];



}

