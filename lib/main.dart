// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/Controller/dio_service.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Features/FeatureWeather/Presentation/weather_app_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DioService(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WeatherAppScreen(),
        ),
      
    );
  }
}