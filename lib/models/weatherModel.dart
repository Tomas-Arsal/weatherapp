import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  String weatherStateName;
  DateTime date;
  double temp;
  double minTemp;
  double maxTemp;

  WeatherModel({
    required this.weatherStateName,
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: DateTime.parse(data['location']['localtime']),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }
  @override
  String toString() {
    return 'tem = $temp  minTemp = $minTemp  date = $date';
  }
}
// String getImage() {
//   if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ||  weatherStateName == 'partly cloudy') {
//     return 'assets/images/clear.png';
//   }
//   else if (weatherStateName == 'Sleet' ||
//       weatherStateName == 'Snow' ||
//       weatherStateName == 'Hail')
//   {
//     return 'assets/images/snow.png';
//   }
//
//   else if (weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' ||  weatherStateName == 'Heavy Cloud' || weatherStateName == 'Mist' || weatherStateName == 'Fog')
//   {
//     return 'assets/images/cloudy.png';
//   }
//  else if (weatherStateName == 'Patchy rain possible' ||
// weatherStateName == 'Heavy Rain' ||
// weatherStateName == 'Showers	')
//  {
// return 'assets/images/rainy.png';
// }
//  else if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder'weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' )
//  {
// return 'assets/images/thunderstorm.png';
// } else {
// return 'assets/images/clear.png';
// }
// }
