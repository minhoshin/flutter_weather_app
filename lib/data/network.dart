import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  String latitude;
  String longitude;
  String apiKey;

  Network(double latitude, double longitude, String apiKey) {
    this.latitude = latitude.toString();
    this.longitude = longitude.toString();
    this.apiKey = apiKey;
  }

  Future<dynamic> getJsonData() async {
    var url =
    Uri.https('api.openweathermap.org', '/data/2.5/weather', {'lat': latitude, 'lon': longitude, 'appid': apiKey, 'units': 'metric'});

    var response = await http.get(url);
    if(response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}