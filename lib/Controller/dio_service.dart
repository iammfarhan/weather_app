// ignore_for_file: unused_field, avoid_types_as_parameter_names, avoid_print, non_constant_identifier_names, unused_local_variable, prefer_final_fields
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/Model/weather_model.dart';
// import 'package:flutter/cupertino.dart';

class DioService extends ChangeNotifier{
  
  static String _apikey = "152131c1dfc05a87f6f7e463a135a149";
    String cityName = "Islamabad";


  weatherCall() {
    fetchweatherdata();
    notifyListeners();
  }

  searchCity(String name) {
    cityName = name;
    fetchweatherdata();
    notifyListeners();
  }

  Future<WeatherModel> fetchweatherdata() async {
    Response response;
    var dio = Dio();
    response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$_apikey');

    print(response.data.toString());
    if (response.statusCode == 200) {
      WeatherModel weatherResult = WeatherModel.fromJson(response.data);
      return weatherResult;
    } else {
      return WeatherModel();
    }
  }
}