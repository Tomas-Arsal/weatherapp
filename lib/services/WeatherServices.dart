import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/weatherModel.dart';

class WeatherServices {
  // /
  Future<WeatherModel> getWeather({required String cityNamed}) async {
    String baseUrl = 'http://api.weatherapi.com/v1';
    String apiKey = '73f479e46a2b4e6189d111236231501 ';
    Uri uri = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityNamed&days=7');

    http.Response response = await http.get(uri);
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
