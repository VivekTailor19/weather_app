import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/screen/homescreen.dart';
import 'package:weather_app/weather_provider.dart';

void main() {
  runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) =>
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
    ),),
  );
}

//    6e2a97e08f38f6d24bc52bc3f1a5c97a

//  lat
//  long
//  name location
//  weather main name, description types,
//  main  temp = C, pressure = hPa, humidity = %
//  wind speed m/s
//

// speed  humidity  pressure

