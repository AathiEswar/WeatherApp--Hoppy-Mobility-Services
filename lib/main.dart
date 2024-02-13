// Main File - Carries the base structure of the weather app

import 'package:flutter/material.dart';
import 'components/WeatherGrid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Weather App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 90,

        backgroundColor:const Color.fromRGBO(31,31,31,31),

        title: Center(child:Text(widget.title ,style: TextStyle(
          letterSpacing: 3,
        fontSize: 40 , fontWeight: FontWeight.w700, color: Colors.green.shade300 ),), )
      ),
      body: Center(
        child: SingleChildScrollView(
          
         scrollDirection: Axis.vertical,

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // The Structural Layout of the cards to be displayed for weather
              WeatherGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

