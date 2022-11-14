import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather/features/mixin_custom_sizedbox.dart';
import 'package:weather/service/extension/string_casing_extension.dart';
import 'package:weather/service/providers/weather_model.dart';
import 'package:weather/widget/next_days.dart';
import 'package:weather/widget/today_detail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<WeatherModel>(context, listen: false).read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Lottie.asset('assets/lottie/background.json',
              fit: BoxFit.cover, width: size.width, height: size.height),
          SafeArea(child: consumer(size)),
        ],
      ),
    );
  }

  Consumer<WeatherModel> consumer(Size size) {
    return Consumer<WeatherModel>(
      builder: (context, value, child) {
        if (value.list.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${value.list[0].day}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                CustomSizedBox.sizedBox(value: 20),
                buildContainer(size, value),
                CustomSizedBox.sizedBox(value: 20),
                const Spacer(),
                NextDays(model: value),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text("Bir Hata meydana geldi"),
          );
        }
      },
    );
  }

  SizedBox buildContainer(Size size, WeatherModel value) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.22,
      child: Column(
        children: [
          TodayDetail(model: value),
          CustomSizedBox.sizedBox(value: 25),
          //buildExpanded(value)
        ],
      ),
    );
  }
}