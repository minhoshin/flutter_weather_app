import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather_screen.dart';
import '../data/my_location.dart';
import '../data/network.dart';
const apiKey = '46ee962fb2d67ecb13fb2dab8a3affc6';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  double latitude3;
  double longitude3;

  @override
  void initState() {
    super.initState();
    geoLocation();
    // fetchData();
  }

  void geoLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network(latitude3, longitude3, apiKey);

    var weatherData = await network.getJsonData();
    print(weatherData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(parseWeatherData: weatherData,);
    }));
  }

  // void fetchData() async {

    //   var myJson = parsingData['weather'][0]['description'];
    //   print(myJson);
    //   var myWind = parsingData['wind']['speed'];
    //   print(myWind);
    //   var myId = parsingData['id'];
    //   print(myId);
    // } else {
    //   print(response.statusCode);
    // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: RaisedButton(
        onPressed: null,
        child: Text(
          'Get my location',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: Colors.blue,
      ),
    ));
  }
}
