import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stormtracker/blocs/weather_bloc.dart';
import 'package:stormtracker/blocs/weather_event.dart';
import 'package:stormtracker/blocs/weather_state.dart';
import 'package:stormtracker/presentation/widgets/current_forecast.dart';
import 'package:stormtracker/presentation/widgets/forecast_section.dart';
import 'package:stormtracker/presentation/widgets/lighthouse_widget.dart';

class StormtrackerHome extends StatefulWidget {
  const StormtrackerHome({super.key});

  @override
  State<StormtrackerHome> createState() => _StormtrackerHomeState();
}

class _StormtrackerHomeState extends State<StormtrackerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (BuildContext context, WeatherState state) {
          if (state is WeatherIsLoading) {
            context.read<WeatherBloc>().add(const FetchWeatherEvent('Nairobi'));
            return const Center(child: CircularProgressIndicator(color: Colors.orange,));
          }

          if (state is WeatherLoaded) {
            return Stack(
              children: [
                Column(
                  children: [
                    CurrentForecast(state: state),
                    ForecastSection(state: state),
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

          if (state is WeatherIsNotLoading) {
            return Center(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                      'For some reason, we can not fetch the weather. Please check your internet connection', textAlign: TextAlign.center,),
                ));
          }

          return const Center(child: Text('Something went wrong'));
        },
      ),
    );
  }
}
