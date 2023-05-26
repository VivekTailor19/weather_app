import 'package:flutter/material.dart';
import 'package:weather_app/weather_api.dart';
import 'package:weather_app/model/weather_model.dart';

import 'model/citiesModel.dart';

class WeatherProvider extends ChangeNotifier
{
  Future<WeatherModel> loadDatas(String? plat,String? plong)
  async {
    return await Weather_API.weather_api.get_weather_api(plat,plong);
  }

  List<CityModel> cities = [
    CityModel(lat:"21.1702" ,long: "72.8311",cityname: "Surat"),
    CityModel(lat:"34.2268" ,long: "77.5619",cityname: "Ladakh"),
    CityModel(lat:"32.2432" ,long: "77.1892",cityname: "Manali"),
    CityModel(lat:"31.1048" ,long: "77.1734",cityname: "Shimla"),
    CityModel(lat:"17.3850" ,long: "78.4867",cityname: "Hyderabad"),
    CityModel(lat:"11.6234",long: "92.7265",cityname: "Port Blair"),
    CityModel(lat:"28.7041" ,long: "77.1025",cityname: "Delhi"),
    CityModel(lat:"48.8566" ,long: "2.3522",cityname: "Paris"),
  ];

  List<String> citylist = [
    "Surat","Ladakh","Manali","Shimla","Hydrabad","Port Blair","Delhi","Paris"
  ];
  String selectcity = "Surat";
  int index = 0;

  void changeitem(String value)
  {
    selectcity = value;
    index = citylist.indexOf(value);
    notifyListeners();
  }
   String selectimage = "assets/images/daily/sunny.png";
  void imagechange(double temp)
  {
    if(temp>=32)
      {
        selectimage = "assets/images/daily/sun.png";
      }
    else if(temp>=25)
      {
        selectimage ="assets/images/daily/sunny.png";
      }
    else if(temp>=20)
      {
        selectimage ="assets/images/daily/cloudy.png";
      }
    else if(temp>=15)
      {
        selectimage ="assets/images/daily/clouds.png";
      }
    else if(temp<=8)
      {
        selectimage ="assets/images/daily/thermometer.png";
      }
    else
      {
        selectimage ="assets/images/daily/normal.png";
      }

  }





}

