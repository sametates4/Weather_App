import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/service/providers/weather_model.dart';

class NextDays extends StatelessWidget {
  const NextDays({Key? key, required this.model}) : super(key: key);
  final WeatherModel model;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.48,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sonraki Günler",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                itemBuilder: (_, index) {
                  var newIndex = model.list[index + 1];
                  return Container(
                    padding: const EdgeInsets.only(bottom: 5),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                            BorderSide(color: Colors.grey, width: 1.2))),
                    child: ListTile(
                      title: Text(
                        newIndex.day.toString(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                      leading:
                      Lottie.asset('assets/lottie/${newIndex.status}.json'),
                      trailing: Text(
                        '${newIndex.degree}° / ${newIndex.night}°',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
