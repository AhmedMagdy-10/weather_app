import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_new/Services/bloc/home_bloc.dart';
import 'package:weather_app_new/Services/bloc/home_state.dart';
import 'package:weather_app_new/models/weather_model.dart';
import 'package:weather_app_new/views/search_view.dart';
import 'package:weather_app_new/widgets/no_weather_body.dart';
import 'package:weather_app_new/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key, this.weatherModel}) : super(key: key);
  final WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SearchView(),
                    ),
                  );
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is InitailState) {
              return const NoWeatherBody();
            } else if (state is SuccessState) {
              return WeatherInfoBody(
                  weather: BlocProvider.of<HomeCubit>(context).model!);
            } else if (state is ErrorState) {
              return const Text('Error');
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
