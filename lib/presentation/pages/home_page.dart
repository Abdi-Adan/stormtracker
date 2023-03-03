import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stormtracker/blocs/weather/weather_bloc.dart';
import 'package:stormtracker/blocs/weather/weather_event.dart';
import 'package:stormtracker/blocs/weather/weather_state.dart';
import 'package:stormtracker/presentation/widgets/current_forecast.dart';
import 'package:stormtracker/presentation/widgets/forecast_section.dart';
import 'package:stormtracker/presentation/widgets/lighthouse_widget.dart';
import 'package:stormtracker/utils/app_utils.dart';
import 'package:stormtracker/utils/constants.dart';

class StormtrackerHome extends StatefulWidget {
  final String currentCity;

  const StormtrackerHome({super.key, required this.currentCity});

  @override
  State<StormtrackerHome> createState() => _StormtrackerHomeState();
}

class _StormtrackerHomeState extends State<StormtrackerHome> {
  Position currentPosition = defaultAppPosition;
  LocationService locationService = LocationService();

  @override
  void initState() {
    super.initState();
    locationService.getLocation().then((position) {
      setState(() {
        currentPosition = position;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<WeatherBloc, WeatherState>(
      builder: (BuildContext context, WeatherState weatherState) {
        if (weatherState is WeatherIsLoading) {
          context.read<WeatherBloc>().add(widget.currentCity.isEmpty
              ? const FetchWeatherEvent('Nairobi')
              : FetchWeatherEvent(widget.currentCity));
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.orange,
          ));
        }

        if (weatherState is WeatherLoaded) {
          return Stack(
            children: [
              Column(
                children: [
                  CurrentForecast(state: weatherState),
                  ForecastSection(state: weatherState),
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.17,
                right: 10,
                child: const LightHouse(),
              )
            ],
          );
        }

        if (weatherState is WeatherIsNotLoading) {
          return Center(
              child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              'For some reason, we can not fetch the weather. Please check your internet connection',
              textAlign: TextAlign.center,
            ),
          ));
        }

        return const Center(child: Text('Something went wrong'));
      },
    ));
  }
}
