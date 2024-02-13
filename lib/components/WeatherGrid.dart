
import 'package:flutter/material.dart';

import '../data.model/weatherData.model.dart';
import 'WeatherCard.dart';

// Layout Component for Weather Cards
class WeatherGrid extends StatefulWidget {
  const WeatherGrid({super.key});

  @override
  State<WeatherGrid> createState() => _WeatherGridState();
}

class _WeatherGridState extends State<WeatherGrid> {
  @override
  Widget build(BuildContext context) {

    // The Layout
    return Container(
      color:Color.fromRGBO(94,94,94,94),
      width: 1700,
      child: Column(
        children: [
          // Iterating through the weather data model and passing it to the card
          for(var i = 0;i<weatherData.length;i++)

            // Weather Card that holds the information
            WeatherCard(
              city : weatherData[i]["city"] ,
              weather : weatherData[i]["weather"] ,
              condition : weatherData[i]["condition"],
              icon : weatherData[i]["icon"]  ,
            ),
        ],
      ),
    );
  }
}