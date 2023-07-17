import 'dart:convert';
import 'package:flutter/material.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  late double latitude;
  late double longitude;

    @override
    void initState () {
      super.initState();
      getData();
    }

    @override
    void deactivate() {
      super.deactivate();
    }

    void Location() async {

      LocationLatitudeLongitude location = LocationLatitudeLongitude();
      await location.getCurrentLocation();
      latitude = location.latitude;
      longitude = location.longitude;
    }


    void getData() async {
      var apiKey = 'e857eafd9c86bd1ceada9ea4b3ab4336';
      var latitude = 15;
      var longitude = 119;

      var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = response.body;
        // print(data);

        var decodedData = jsonDecode(data);

        double temperature = decodedData['main']['temp'];

        int condition = decodedData['weather'][0]['id'];

        String cityName = decodedData['name'];

        print(temperature);
        print(condition);
        print(cityName);

      } else {
        print('Error: ${response.statusCode}');
      }

    }


    @override
  Widget build(BuildContext context) {
      return Scaffold();
  }
}
