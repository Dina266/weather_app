import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/views/splash_view.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../models/extractedMethod.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff080C18),
            Color.fromARGB(255, 30, 28, 53),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
              )),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
          children: [
            Center(
              heightFactor: 7,
              widthFactor: 5.8,
              child: Opacity(
                opacity: 0.7,
                child: Transform.scale(
                  scale: 4,
                  child: Image.network(
                    'https:${weatherModel.image!}',
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          DateFormat.yMMMEd('en_US')
                              .format(DateTime.parse(weatherModel.date)),
                          style:
                              const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: Colors.white,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${weatherModel.cityName}, ${weatherModel.country}', //'Alexandria, Egypt',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (ctx) => const SplashView())),
                      icon: const Icon(Icons.search),
                      color: Colors.white,
                    )
                  ],
                ),
                const SizedBox(
                  height: 150,
                ),
                Text(
                  '${weatherModel.temp.round()}°',
                  style: const TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 253, 253, 253)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(weatherModel.weatherCondition,
                    style: const TextStyle(color: Colors.white, fontSize: 20)),
                const SizedBox(height: 5),
                Text(
                  'Feels Like ${weatherModel.feelsLike.round()}°',
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.water_drop_outlined, color: Colors.white),
                    const SizedBox(width: 5),
                    Text('${weatherModel.avgHumidity.round()}%',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16)),
                    const Spacer(),
                    const Icon(Icons.wind_power, color: Colors.white),
                    const SizedBox(width: 5),
                    Text('${weatherModel.wind.round()} km/h',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14)),
                    const Spacer(),
                    const Icon(Icons.speed, color: Colors.white),
                    const SizedBox(width: 5),
                    Text('${weatherModel.pressure.round()} mbar',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14)),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.only(left: 2, top: 15),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Today',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 130,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    ListCategory(weatherModel, 0),
                    ListCategory(weatherModel, 1, houre1, weatherModel.tempHour1,
                        weatherModel.iconHour1),
                    ListCategory(weatherModel, 1, houre2, weatherModel.tempHour2,
                        weatherModel.iconHour2),
                    ListCategory(weatherModel, 1, houre3, weatherModel.tempHour3,
                        weatherModel.iconHour3),
                    ListCategory(weatherModel, 1, houre4, weatherModel.tempHour4,
                        weatherModel.iconHour4),
                  ]),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.only(left: 2, top: 15),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Next Forcast',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                RowList(weatherModel, 0),
                const SizedBox(height: 20),
                RowList(
                    weatherModel,
                    1,
                    weatherModel.scenodDayDate.toString(),
                    weatherModel.secondDayIcon,
                    weatherModel.secondDayMaxTemp,
                    weatherModel.secondDayMinTemp),
                const SizedBox(height: 20),
                RowList(
                    weatherModel,
                    1,
                    weatherModel.thirdDayDate.toString(),
                    weatherModel.thirdDayIcon,
                    weatherModel.thirdDayMaxTemp,
                    weatherModel.thirdDayMinTemp),
                const SizedBox(height: 20),
              ],
            ),
          ],
              ),
            ),
        ));
  }
}
