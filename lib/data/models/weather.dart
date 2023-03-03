class WeatherModel {
  final double temp;
  final double tempMin;
  final double tempMax;
  final String main;
  final String cityName;
  final String date;

  WeatherModel({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.main,
    required this.cityName,
    required this.date,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json, String mainWeather,
      String cityName, String date) {
    WeatherModel weatherModel = WeatherModel(
      temp: (json['temp'] - 273.15),
      tempMin: (json['temp_min'] - 273.15),
      tempMax: (json['temp_max'] - 273.15),
      main: mainWeather,
      cityName: cityName,
      date: date,
    );
    return weatherModel;
  }
}
