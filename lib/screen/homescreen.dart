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
                return Container(height: 100.h,width: 100.w,
                  decoration: BoxDecoration(image: DecorationImage(
                    image: NetworkImage("https://images.unsplash.com/photo-1434281406913-47acccb03654?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1vcm5pbmclMjBuYXR1cmV8ZW58MHx8MHx8fDA%3D&w=1000&q=80"),fit: BoxFit.fill
                  )),
                  child: Padding(
                    padding:  EdgeInsets.all(15.sp),
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_rounded,color: Colors.blue,size: 20.sp,),
                            DropdownMenu(
                            enableSearch: true,

                            dropdownMenuEntries: [
                              DropdownMenuEntry(label: "Hello",value: 10),
                            ]),
                            Text("${weather.name}",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w900,color: Colors.red),)
                          ],
                        ),


                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.sp),
                          child: Image.asset("assets/images/Capture.JPG",height: 30.h,),
                        ),
                        
                        Text("It's ${weather.weather![0].description}",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w300,color: Colors.indigo),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text("${weather.main!.temp}",style: TextStyle(fontSize: 40.sp,fontWeight: FontWeight.w500,color: Colors.tealAccent),),
                            Text("${weather.weather![0].main}",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w300,color: Colors.tealAccent),),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.sp),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Items(imgpath: "assets/images/Capture.JPG",title: "Wind",data:"${weather.wind!.speed} m/s" ),
                              Items(imgpath: "assets/images/Capture.JPG",title: "Pressure",data:"${weather.main!.pressure} hPa" ),
                              Items(imgpath: "assets/images/Capture.JPG",title: "Humidity",data:"${weather.main!.humidity} %" ),

                            ],
                          ),
                        )






                        



                      ],
                    ),
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
      color: Colors.amber,
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(height: 5.w),
          Image.asset("$imgpath",height: 10.h,),
          Spacer(),
          Text("$data",style: TextStyle(fontSize: 14.sp,color: Colors.red),),
          Text("$title",style: TextStyle(fontSize: 12.sp,color: Colors.red),),


        ],
      ),
    );

  }

}
