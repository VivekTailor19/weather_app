import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather_model.dart';
import 'package:weather_app/weather_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  WeatherProvider? weatherT;
  WeatherProvider? weatherF;

  @override
  Widget build(BuildContext context) {

    weatherT = Provider.of<WeatherProvider>(context,listen: true);
    weatherF = Provider.of<WeatherProvider>(context,listen: false);


    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: weatherF!.loadDatas(),
          builder: (context, snapshot) {
            if(snapshot.hasError)
              {
                return Text("${snapshot.error}");
              }
            else if(snapshot.hasData)
              {
                WeatherModel weather = snapshot.data!;
                return Center(
                  child: Column(
                    children: [
                      Text("${weather.name}"),

                    ],
                  ),
                );
              }
            return  CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.teal,
            );
          },

        ),


      ),
    );
  }
}
