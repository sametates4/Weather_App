import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/service/extension/string_casing_extension.dart';
import 'package:weather/service/providers/weather_model.dart';

class TodayDetail extends StatelessWidget {
  const TodayDetail({Key? key, required this.model}) : super(key: key);
  final WeatherModel model;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              width: 80,
              height: 80,
              child: Lottie.asset('assets/lottie/${model.list[0].status}.json')),
          const SizedBox(
            width: 20,
          ),
          const VerticalDivider(
            color: Colors.grey,
            thickness: 1.3,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            "${model.list[0].degree}°",
            style: const TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Text(
            model.list[0].description.toString().toCapitalized(),
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
