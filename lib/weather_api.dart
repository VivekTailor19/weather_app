import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class Weather_API
{
  static Weather_API weather_api = Weather_API();
  Future<WeatherModel> get_weather_api(String? lat,String? long)
  async {
    String weather_api_link = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=27b4b62af22f34b9d2cb91d921d3c4cb&units=metric";
    var response = await http.get(Uri.parse(weather_api_link));
    var jsondata = jsonDecode(response.body);

    return await WeatherModel.fromJson(jsondata);
  }
}

//      &units=metric