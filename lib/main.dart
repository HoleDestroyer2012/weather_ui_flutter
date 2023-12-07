import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Weather Forecast",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.red.shade500,
        ),
        backgroundColor: Colors.red.shade500,
        body: _body(),
      ),
    );
  }
}

Column _body() {
  return Column(
    children: [
      _textFormField(),
      Divider(color: Colors.transparent),
      _cityDetail(),
      Divider(
        color: Colors.transparent,
        height: 30,
      ),
      _temperatureDetail(),
      Divider(
        color: Colors.transparent,
        height: 30,
      ),
      _extraVeatherDetail(),
      Divider(
        color: Colors.transparent,
        height: 30,
      ),
      Text(
        "7-DAY WEATHER FORECAST",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      Divider(
        color: Colors.transparent,
        height: 30,
      ),
      _bottomDetail(),
    ],
  );
}

TextField _textFormField() {
  return TextField(
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.search),
      labelText: "Enter City Name",
      prefixIconColor: Colors.white,
      labelStyle: TextStyle(color: Colors.white),
      border: InputBorder.none,
    ),
  );
}

Column _cityDetail() {
  return Column(
    children: [
      Text(
        "Kemerovskaya Oblast, RU",
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.w300),
      ),
      Divider(color: Colors.transparent),
      Text(
        "Friday, Mar 20, 2020",
        style: TextStyle(color: Colors.white54, fontSize: 20),
      )
    ],
  );
}

Row _temperatureDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.sunny,
        color: Colors.white,
        size: 100,
      ),
      SizedBox(
        width: 15,
      ),
      Column(
        children: [
          Text(
            "14 F",
            style: TextStyle(
                color: Colors.white, fontSize: 50, fontWeight: FontWeight.w100),
          ),
          Text(
            "LIGHT SNOW",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    ],
  );
}

Row _extraVeatherDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _extaraWeatherDetailCol(Icons.cloudy_snowing, 5, "km/hr"),
      SizedBox(
        width: 90,
      ),
      _extaraWeatherDetailCol(Icons.cloudy_snowing, 3, "%"),
      SizedBox(
        width: 90,
      ),
      _extaraWeatherDetailCol(Icons.cloudy_snowing, 20, "%"),
    ],
  );
}

Column _extaraWeatherDetailCol(IconData icon, int number, String text) {
  return Column(
    children: [
      Icon(
        icon,
        color: Colors.white,
        size: 40,
      ),
      Text(
        "${number}",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      Text(
        text,
        style: TextStyle(color: Colors.white),
      )
    ],
  );
}

Widget _bottomDetail() {
  List<WeatherComponent> weatherComponents = [
    WeatherComponent(icon: Icons.cloud, temperature: 8, day: "Friday"),
    WeatherComponent(icon: Icons.cloud, temperature: 8, day: "Friday"),
    WeatherComponent(icon: Icons.cloud, temperature: 8, day: "Friday"),
    WeatherComponent(icon: Icons.cloud, temperature: 8, day: "Friday"),
    WeatherComponent(icon: Icons.cloud, temperature: 8, day: "Friday"),
  ];
  return Container(
    height: 120,
    child: ListView.builder(
      padding: EdgeInsets.all(8),
      shrinkWrap: false, 
      scrollDirection: Axis.horizontal,
      itemCount: weatherComponents.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 150,
          margin: EdgeInsets.symmetric(horizontal: 10),
          color: Colors.red.shade300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${weatherComponents[index].day}',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${weatherComponents[index].temperature} F",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    weatherComponents[index].icon,
                    size: 50,
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
        );
      },
    ),
  );
}

class WeatherComponent {
  IconData icon;
  int temperature;
  String day;

  WeatherComponent(
      {required this.icon, required this.temperature, this.day = "Monday"});
}
