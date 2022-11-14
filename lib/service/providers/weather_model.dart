import 'package:flutter/material.dart';
import 'package:weather/service/get_weather_data/get_weather_data.dart';

import '../model/weather_model.dart';

class WeatherModel extends ChangeNotifier{
  List<Result> list = <Result>[];
  bool loading = false;

  Future<void> read()async{
    loading = true;
    list = (await getWeatherData())!.result ?? [];
    loading = false;
    notifyListeners();
  }
}