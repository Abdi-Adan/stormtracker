import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:stormtracker/data/models/weather.dart';

class WeatherRepo {
  var apiKey = 'b5d25753b8cd035ce1487c1473b2d278';

  Future<WeatherModel> getCurrentWeather(String cityName) async {
    var baseUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');
    final result = await http.Client().get(baseUrl);

    if (result.statusCode != 200) {
      // Would otherwise fail static analysis. This is just a temporary provision.
      // ignore: avoid_print
      print('Get current weather API call for $cityName has failed');
      throw Exception();
    }

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final jsonDecoded = json.decode(result.body);

    return parseWeatherResultJson(jsonDecoded, cityName, formattedDate);
  }

  Future<List<WeatherModel>> get5DayForecast(String cityName) async {
    var baseUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKey');
    final result = await http.Client().get(baseUrl);

    if (result.statusCode != 200) {
      // Would otherwise fail static analysis. This is just a temporary provision.
      // ignore: avoid_print
      print('Get current weather API call for $cityName has failed');
      throw Exception();
    }

    List<dynamic> rawForecastData = json.decode(result.body)['list'];
    Map<String, dynamic> filteredForecastData = {};

    // ignore: avoid_function_literals_in_foreach_calls
    rawForecastData.forEach((forecast) {
      // Get the date of the forecast as a string in the format "yyyy-MM-dd"
      String date = forecast['dt_txt'].toString().substring(0, 10);

      // If the date hasn't been added to the filtered data yet, add it
      if (!filteredForecastData.containsKey(date)) {
        filteredForecastData[date] = forecast;
      }
    });

    List<WeatherModel> finalForecasts = [];

    // ignore: avoid_function_literals_in_foreach_calls
    filteredForecastData.forEach((key, value) {
      finalForecasts.add(parseWeatherResultJson(value, cityName, key));
    });

    return finalForecasts;
  }

  WeatherModel parseWeatherResultJson(
      final dynamic decodedResponse, String cityName, String date) {
    final String weatherMain = decodedResponse['weather'][0]['main'];
    return WeatherModel.fromJson(
        decodedResponse['main'], weatherMain, cityName, date);
  }
}
