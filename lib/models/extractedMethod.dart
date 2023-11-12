  import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather.dart';

Padding ListCategory(WeatherModel weatherModel,[
    int index = 1 , 
    int hour =0,
    double tempHour =0,
    String iconHour ='',
  ]) {
    return Padding(
                      padding: const EdgeInsets.only(right: 15, top: 9),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            // color: Color(0xff191828),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xff191828),
                                  index ==0 ? const Color.fromARGB(255, 73, 72, 95)
                                    : const Color.fromARGB(255, 32, 31, 51),
                                ])),
                        width: 65,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                index ==0 ?'Now' :'${hour.toString()} : 00',
                                style: TextStyle(color: Colors.white),
                              ),
                              Image.network(
                                index ==0 ?'https:${weatherModel.image}' : 'https:${iconHour}',
                                scale: 2,
                              ),
                              Text(
                                index ==0 ? '${weatherModel.temp.round().toString()}°' : '${tempHour.round().toString()}°',
                                style: TextStyle(color: Colors.white),
                              ),
                            ]),
                      ),
                    );
  }


  
  Row RowList(WeatherModel weatherModel,[
    int index = 1 , 
    String date = '' , 
    String icon ='',
    maxT =0 ,
    minT =0
  ]) {
    return Row(
              // 5 days
              children: [
                Text(
                  index == 0? 'Today' : DateFormat.MMMd('en_US')
                            .format(DateTime.parse(date)),
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const Spacer(),
                const SizedBox(
                  width: 30,
                ),
                Image.network(
                                index ==0 ?'https:${weatherModel.image}' : 'https:${icon}',
                                scale: 2.5,
                              ),
                const Spacer(),
                Text(index ==1 ?'${minT.round()}° / ${maxT.round()}°':'${weatherModel.minTemp.round()}° / ${weatherModel.maxTemp.round()}°',
                    style: const TextStyle(color: Colors.white, fontSize: 16))
              ],
            );
  }
