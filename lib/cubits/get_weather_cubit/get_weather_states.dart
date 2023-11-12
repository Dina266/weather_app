
import 'package:weather_app/models/weather.dart';

class WeatherState{}
class InitialState extends WeatherState{}

class WeatherLoadedState  extends WeatherState{
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}
class WeatherFailureState  extends WeatherState{}


















//create states
//create cubit
//create function
// provide cubit
//inegrate cubit
//trigger cubit