import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../Shared/Component.dart';
import '../models/weatherModel.dart';
import '../providers/WeatherProvider.dart';
import '../services/WeatherServices.dart';

class searchScreen extends StatelessWidget {
  var TextSearch = TextEditingController();
  String? cityName ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: defaultTextFormField(
              onchanged: (data ){
                cityName = data ;
              },
              onsumited: (data) async{
                cityName = data ;
                WeatherServices sercvise = WeatherServices();
             WeatherModel? weather=
             await sercvise.getWeather(cityNamed: cityName!);
             Provider.of<WeatherProvider>(  context , listen: false).weatherData = weather ;

                Provider.of<WeatherProvider>(  context , listen: false).cityName = cityName ;

                Navigator.pop(context);
              },
              controller: TextSearch,
              textInputType: TextInputType.emailAddress,
              label: 'Search',
              validate: (String? value) {
                if (value!.isEmpty) {
                  return 'Please Enter Your search Adress';
                }
              },
              prefix: Icons.search,
            ),
          ),
        ],
      ),
    );
  }
}
