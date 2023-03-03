import 'package:equatable/equatable.dart';
import 'package:stormtracker/data/models/weather_model.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherIsLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weather;
  final List<WeatherModel> forecasts;

  const WeatherLoaded(this.weather, this.forecasts);

  @override
  List<Object> get props => [weather, forecasts];
}

class WeatherIsNotLoading extends WeatherState {}
