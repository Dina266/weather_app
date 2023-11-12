import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:weather_app/models/weather.dart';

class WeatherService {

  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '0017c3e42a1647d780a154941230210';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather ({required String cityName }) async{
    try {
      Response response = await 
    dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=4');

    WeatherModel weatherModel = WeatherModel.fromJson(response.data);

    // log((response.data['forecast']['forecastday'][0]['hour'][0]['feelslike_c']).toString());

    return weatherModel;
    }on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ?? 'oops there was an error, try later';
      throw Exception(errorMessage);
    }catch(e) {
      log(e.toString());
      throw Exception('oops there was an error, try later');
    }

  }

  
}