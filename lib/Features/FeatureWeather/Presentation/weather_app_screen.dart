// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:weather_app/Controller/dio_service.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Features/FeatureWeather/Presentation/Widgets/app_bar.dart';
import 'package:weather_app/Model/weather_model.dart';

class WeatherAppScreen extends StatefulWidget {
  const WeatherAppScreen({Key? key}) : super(key: key);

  @override
  State<WeatherAppScreen> createState() => _WeatherAppScreenState();
}

class _WeatherAppScreenState extends State<WeatherAppScreen> {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<DioService>((context), listen: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff1B1D25),
        title: Text(
          "Weather App💙",
        ),
        elevation: 0,
      ),
      body:
       FutureBuilder<WeatherModel>(
          future: state.fetchweatherdata(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              final double temperatue = snapshot.data!.main!.temp! - 273.15;
              final icon = snapshot.data!.weather!.first.icon;
              return Column(children: [
                AppBarScreen(),
                Container(
                    width: 350,
                    decoration: BoxDecoration(
                        color: Color(0xff1B1D25),
                        borderRadius: BorderRadius.circular(18)),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.network(
                              "http://openweathermap.org/img/wn/$icon@2x.png"),
                        ),
                        const SizedBox(
                          height: 05,
                        ),
                        Column(
                          children: [
                            Text(
                              snapshot.data!.weather!.first.description
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 24),
                            ),
                            Text(
                              " ${snapshot.data!.name}, ${snapshot.data!.sys!.country}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 350,
                    decoration: BoxDecoration(
                        color: Color(0xff1B1D25),
                        borderRadius: BorderRadius.circular(18)),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset(
                            "assets/images/temp.png",
                            width: 60,
                            height: 60,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              temperatue.toString().substring(0, 2),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 24),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "C🌡",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 350,
                    decoration: BoxDecoration(
                        color: Color(0xff1B1D25),
                        borderRadius: BorderRadius.circular(18)),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset(
                            "assets/images/rain.png",
                            width: 60,
                            height: 60,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snapshot.data!.wind!.speed!.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 24),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "% ☔",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ]);
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
          })),
    );
  }
}
