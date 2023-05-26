import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/homescreen.dart';
import 'package:weather_app/weather_provider.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => WeatherProvider(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/":(context) => HomeScreen(),


          },
        ),
      ),
    ),
  );
}

//    6e2a97e08f38f6d24bc52bc3f1a5c97a

// lat long
//  weather main, description,
//  main  temp,pressure, humidity
// wind speed
//

