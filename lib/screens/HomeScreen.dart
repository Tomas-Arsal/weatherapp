import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/screens/searchscreen.dart';
import '../models/weatherModel.dart';
import '../providers/WeatherProvider.dart';


class HomeScreen extends StatelessWidget {
  WeatherModel? weatherData ;
  @override
  Widget build(BuildContext context) {
     weatherData = Provider.of<WeatherProvider>(context , listen: true).weatherData ;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=> searchScreen()));
          }, icon: Icon(Icons.search))
        ],
      ),
      body: weatherData ==
              null
          ? const Center(
              child: Text(
                'Do not found any result ....... right now ! ',
                style: TextStyle(fontSize: 30),
              ),
            )
          : Container(
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Column(
                    children:  [
                      Text(
                        Provider.of<WeatherProvider>(context).cityName!,
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(weatherData!.date.hour.toString()),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        '☀',
                        style: TextStyle(fontSize: 60),
                      ),
                       Text(
                       ' ${weatherData!.temp.toInt()} ',
                        style: TextStyle(fontSize: 60),
                      ),
                      Column(
                        children:  [
                          Text('minTemp : ${weatherData!.minTemp.toInt()}'),
                          Text('maxTemp:${weatherData!.minTemp.toInt()}'),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                   Text(
                    weatherData!.weatherStateName,
                    style: const TextStyle(fontSize: 30),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
    );
  }
}
