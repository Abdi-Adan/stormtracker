import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stormtracker/blocs/weather/weather_event.dart';
import 'package:stormtracker/blocs/weather/weather_state.dart';
import 'package:stormtracker/data/models/weather_model.dart';
import 'package:stormtracker/data/repositories/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo _weatherRepo = WeatherRepo();

  WeatherBloc() : super(WeatherIsLoading()) {
    on<FetchWeatherEvent>((event, emit) async {
      try {
        WeatherModel currentWeather =
            await _weatherRepo.getCurrentWeather(event.cityName);
        List<WeatherModel> forecasts =
            await _weatherRepo.get5DayForecast(event.cityName);
        emit(WeatherLoaded(currentWeather, forecasts));
      } catch (_) {
        emit(WeatherIsNotLoading());
      }
    });
  }
}
