import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app_new/models/weather_model.dart';

class WeatherServices {
  final dio = Dio();

  Future<WeatherModel> getCurrentWeather({
    required String? cityName,
  }) async {
    try {
      var response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=2be36b5426784e9788d155145232306&q=$cityName&days=10',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      String errorMagssage = e.response?.data['error']['message'] ??
          'oops there an was error ,try later';
      throw Exception(errorMagssage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error');
    }
  }
}
