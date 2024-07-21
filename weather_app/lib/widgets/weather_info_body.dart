import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_new/Services/bloc/home_bloc.dart';
import 'package:weather_app_new/main.dart';
import 'package:weather_app_new/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});
  final WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel model = BlocProvider.of<HomeCubit>(context).model!;
    final date = DateFormat('hh:mm a');
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            knowWeatherCondition(model.condition),
            knowWeatherCondition(model.condition)[400]!,
            knowWeatherCondition(model.condition)[200]!,
            knowWeatherCondition(model.condition)[50]!
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    '${model.cityName}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    'updated at ${date.format(model.date)}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      'https:${model.image}',
                    ),
                    Text(
                      '${model.temp}',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'maxTemp:${model.maxTemp.round()}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'minTemp:${model.minTemp.round()}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Text(
                '${model.condition}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
