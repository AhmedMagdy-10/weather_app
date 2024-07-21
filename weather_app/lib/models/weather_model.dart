class WeatherModel {
  final String? cityName;
  final num maxTemp;
  final num minTemp;
  final DateTime date;
  final num temp;
  final String? image;
  final String? condition;

  WeatherModel({
    required this.cityName,
    required this.maxTemp,
    required this.minTemp,
    required this.date,
    required this.temp,
    required this.image,
    required this.condition,
  });
  factory WeatherModel.fromJson(jsonData) {
    return WeatherModel(
      cityName: jsonData['location']['name'],
      maxTemp: jsonData['forecast']['forecastday'][0]['day']["maxtemp_c"],
      minTemp: jsonData['forecast']['forecastday'][0]['day']["mintemp_c"],
      temp: jsonData['forecast']['forecastday'][0]['day']['avgtemp_c'],
      date: DateTime.parse(jsonData['current']['last_updated']),
      image: jsonData['forecast']['forecastday'][0]['day']['condition']["icon"],
      condition: jsonData['forecast']['forecastday'][0]['day']['condition']
          ["text"],
    );
  }
}

// class Condition {
//   final String text;

//   Condition({required this.text});

//   factory Condition.fromJson(data) {
//     return Condition(text: text);
//   }
// }
