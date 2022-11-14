import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weather/service/constans.dart';
import 'package:weather/service/model/weather_model.dart';

Future<Weather?> getWeatherData() async {
  Uri url = Uri.parse(baseUrl);
  var response = await http.get(url, headers: {'authorization': apiKey, 'content-type': 'application/json'});
  if(response.statusCode == HttpStatus.ok){
    final body = response.body;
    if(jsonDecode(body) is Map<String, dynamic>){
      return Weather.fromJson(jsonDecode(body));
    }
    return null;
  }
  return null;
}
