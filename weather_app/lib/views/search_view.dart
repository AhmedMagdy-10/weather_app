import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_new/Services/bloc/home_bloc.dart';
import 'package:weather_app_new/Services/bloc/home_state.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Search City',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onSubmitted: (cityName) async {
                  if (cityName.isNotEmpty) {
                    BlocProvider.of<HomeCubit>(context)
                        .getWeatherData(cityName: cityName);

                    Navigator.of(context).pop();
                  }
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  suffixIcon: const Icon(Icons.search),
                  label: const Text(
                    'Search',
                    style: TextStyle(fontSize: 18, color: Colors.orange),
                  ),
                  hintText: 'Search City Name',
                ),
              )),
        ),
      ),
    );
  }
}
