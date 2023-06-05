import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/model/weather_model.dart';
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
        backgroundColor: Color(0xff0B0C1E),
        body: FutureBuilder(
          future: weatherF!.loadDatas(weatherT!.cities[weatherT!.index].lat,weatherT!.cities[weatherT!.index].long),
          builder: (context, snapshot) {
            if(snapshot.hasError)
              {
                return Text("${snapshot.error}");
              }
            else if(snapshot.hasData)
              {

                WeatherModel weather = snapshot.data!;
                weatherT!.imagechange(weather.main!.temp!);
                return Padding(
                  padding:  EdgeInsets.all(15.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.location_on_rounded,color: Colors.white54,size: 20.sp,),
                          DropdownButton(
                            icon: Icon(Icons.expand_more_rounded,size: 15.sp,color: Colors.white54,),
                            underline: Container(),
                            //dropdownColor: Colors.transparent,
                            dropdownColor: Color(0xff0B0C1E),
                            alignment: Alignment.center,

                            items:
                          weatherF!.citylist.map((e) => DropdownMenuItem(
                            child: Text("$e",style: TextStyle(color: Colors.amber),),value: e,) ).toList(),

                           value: weatherT!.selectcity,

                           onChanged: (value) {

                            weatherF!.changeitem(value as String);

                          },
                          ),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.sp),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("${weatherT!.selectimage}",height: 35.h,),
                          ],
                        ),
                      ),

                      Text("It's ${weather.weather![0].description}",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w300,color: Colors.white30),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text("${weather.main!.temp}°C",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w500,color: Colors.tealAccent),),
                          Text("\t\t\t\"${weather.weather![0].main}\"",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w300,color: Colors.tealAccent),),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.sp),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Items(imgpath: "assets/images/wind.png",title: "Wind",data:"${weather.wind!.speed} m/s" ),
                            Items(imgpath: "assets/images/atmospheric.png",title: "Pressure",data:"${weather.main!.pressure} hPa" ),
                            Items(imgpath: "assets/images/water.png",title: "Humidity",data:"${weather.main!.humidity} %" ),

                          ],
                        ),
                      )

                    ],
                  ),
                );
              }
            return  Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.teal,
              ),
            );
          },

        ),


      ),
    );
  }

  Widget Items({String? data,String? title,String? imgpath})
  {
    return Container(

      height: 20.h,
      width: 27.w,

      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(height: 5.w),
          Image.asset("$imgpath",height: 10.h,),
          Spacer(),
          Text("$data",style: TextStyle(fontSize: 14.sp,color: Colors.white70),),
          Text("$title",style: TextStyle(fontSize: 12.sp,color: Colors.white54),),


        ],
      ),
    );

  }

}
