import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        // backgroundColor: Colors.blue,
        title: const Text(
          "Search City",
          style: TextStyle(
              // fontWeight: FontWeight.bold,
              // color: Colors.white,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.of(context).pop();
            },
            enabled: true,
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
              hintText: "Enter city name",
              // hintStyle: TextStyle(),
              border: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(color: Colors.green),
              ),
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(16.0),
              //   borderSide: const BorderSide(color: Colors.blue),
              // ),

              // focusedBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(16.0),
              //   borderSide: const BorderSide(color: Colors.blue),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}

// WeatherModel? weatherModel;
