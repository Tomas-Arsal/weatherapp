import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/WeatherProvider.dart';
import 'package:weatherapp/screens/HomeScreen.dart';


void main() => runApp(ChangeNotifierProvider(
    create: (BuildContext context) {
      return WeatherProvider();
    },
    child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
