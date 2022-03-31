// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable, must_be_immutable, unused_import, unused_element, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';
import '../../../../Controller/dio_service.dart';
import 'package:provider/provider.dart';

class AppBarScreen extends StatefulWidget {
  const AppBarScreen({Key? key}) : super(key: key);

  @override
  State<AppBarScreen> createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> {
  TextEditingController namecity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<DioService>((context), listen: true);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
                  controller: namecity,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle:
                        const TextStyle(fontSize: 15, color: Colors.white),
                    hintText: 'Search City 👋',
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Color(0xff1B1D25),
                  ),
                  onTap: (){if (namecity.text.isNotEmpty) {
                      state.searchCity(namecity.text);
                    }},
                ),
    );
  }
}
