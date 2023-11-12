import 'dart:developer';

DateTime now = DateTime.now();
int houre1 = (now.hour + 1) % 24 > 12 ? (now.hour + 1) % 24-12 : (now.hour + 1) % 24;
int houre2 = (now.hour + 2) % 24 > 12 ? (now.hour + 2) % 24-12 : (now.hour + 2) % 24;
int houre3 = (now.hour + 3) % 24 > 12 ? (now.hour + 3) % 24-12 : (now.hour + 3) % 24;
int houre4 = (now.hour + 4) % 24 > 12 ? (now.hour + 4) % 24-12 : (now.hour + 4) % 24;

/////////////////

class WeatherModel {
  
  final String cityName;
  final String country;
  final String date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  final double feelsLike;
  final double avgHumidity;
  final double wind;
  final double pressure;
  //////////
  double tempHour1;
  double tempHour2;
  double tempHour3;
  double tempHour4;
  String iconHour1;
  String iconHour2;
  String iconHour3;
  String iconHour4;
  ////////////////
  DateTime scenodDayDate;
  String secondDayIcon;
  double secondDayMaxTemp;
  double secondDayMinTemp;

  DateTime thirdDayDate;
  String thirdDayIcon;
  double thirdDayMaxTemp;
  double thirdDayMinTemp;

  WeatherModel({
    required this.cityName,
    required this.country,
    required this.date,
    this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
    required this.feelsLike,
    required this.avgHumidity,
    required this.wind,
    required this.pressure,
    required this.tempHour1,
    required this.tempHour2,
    required this.tempHour3,
    required this.tempHour4,
    required this.iconHour1,
    required this.iconHour2,
    required this.iconHour3,
    required this.iconHour4,
    required this.scenodDayDate,
    required this.secondDayIcon,
    required this.secondDayMaxTemp,
    required this.secondDayMinTemp,
    required this.thirdDayDate,
    required this.thirdDayIcon,
    required this.thirdDayMaxTemp,
    required this.thirdDayMinTemp,
  });
  

  factory WeatherModel.fromJson(json) {
    log(houre1.toString());
    // ignore: unused_local_variable
    var jsonData =json['forecast']['forecastday'][0]['day'];
    var hoursTemp=json['forecast']['forecastday'][0]['hour'];
    var jsonData2=json['forecast']['forecastday'][1]['day'];
    var jsonData3=json['forecast']['forecastday'][2]['day'];

    return WeatherModel(
      cityName: json['location']['name'],
      country: json['location']['country'],
      date: json['current']['last_updated'],
      pressure: json['current']['pressure_mb'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      wind: json['forecast']['forecastday'][0]['day']['maxwind_mph'],
      avgHumidity: json['forecast']['forecastday'][0]['day']['avghumidity'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      feelsLike: json['forecast']['forecastday'][0]['hour'][0]['feelslike_c'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],


      tempHour1: hoursTemp[houre1]['temp_c'],
      tempHour2: hoursTemp[houre2]['temp_c'],
      tempHour3: hoursTemp[houre3]['temp_c'],
      tempHour4: hoursTemp[houre4]['temp_c'],
      iconHour1: hoursTemp[houre1]['condition']['icon'],
      iconHour2: hoursTemp[houre2]['condition']['icon'],
      iconHour3: hoursTemp[houre3]['condition']['icon'],
      iconHour4: hoursTemp[houre4]['condition']['icon'],


      scenodDayDate: DateTime.parse(json['forecast']['forecastday'][1]['date']),
      secondDayIcon: jsonData2['condition']['icon'],
      secondDayMaxTemp: jsonData2['maxtemp_c'],
      secondDayMinTemp: jsonData2['mintemp_c'],

      thirdDayDate: DateTime.parse(json['forecast']['forecastday'][2]['date']),
      thirdDayIcon: jsonData3['condition']['icon'],
      thirdDayMaxTemp: jsonData3['maxtemp_c'],
      thirdDayMinTemp: jsonData3['mintemp_c'],
    );
  }
}
