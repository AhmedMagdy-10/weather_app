import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_new/Services/bloc/home_state.dart';
import 'package:weather_app_new/Services/weather_services.dart';
import 'package:weather_app_new/models/weather_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitailState());

  WeatherModel? model;

  getWeatherData({
    required String cityName,
  }) async {
    try {
      model = await WeatherServices().getCurrentWeather(cityName: cityName);
      emit(SuccessState());
    } catch (e) {
      emit(ErrorState(errorMassage: e.toString()));
    }
  }
}
