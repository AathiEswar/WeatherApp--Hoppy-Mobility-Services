import 'package:flutter/material.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard(
      {super.key,
      required this.city,
      required this.weather,
      required this.condition,
      required this.icon});

  // Initializing all the props
  final String city;
  final double weather;
  final String condition;
  final IconData icon;

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  // To toggle between Fahrenheit and Celsius
  bool isFahrenheit = true;

  // Function to toggle temperature unit
  void toggleTemperatureUnit() {
    setState(() {
      isFahrenheit = !isFahrenheit;
    });
  }

  // Function to convert fahrenheit to celsius
  String conversionToCelsius(double f) {
    return ((f - 32) * 5 / 9).toStringAsFixed(1);
  }

  // To toggle between hover
  bool isHover = false;

  // Function to handle Hover
  void toggleHover(e) {
    setState(() {
      isHover = !isHover;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Transform.scale for hovering effect
    return Transform.scale(
      //changes scale of the card based on the boolean-isHover
      scale: isHover ? 1.05 : 1,
      child: MouseRegion(
        // Evaluates the hover
        onEnter: toggleHover,
        onExit: toggleHover,
        child: Container(
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade600,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            color: Color.fromRGBO(31, 31, 31, 31),
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.all(16.0),
          width: 300,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Container containing the temperature and weather condition in symbol
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${isFahrenheit ? widget.weather : conversionToCelsius(widget.weather)}°${isFahrenheit ? 'F' : 'C'}",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Icon(widget.icon, size: 64, color: Colors.white),
                ],
              ),

              // Container containing the city name and weather condition
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.city,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.condition,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // The button to toggle between fahrenheit and celsius
              ElevatedButton(
                // Evaluates the toggle event
                onPressed: toggleTemperatureUnit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),

                child: Text(
                  isFahrenheit ? "Switch to Celsius" : "Switch to Fahrenheit",
                  style: const TextStyle(
                    color: Color.fromRGBO(41, 41, 41, 41),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
