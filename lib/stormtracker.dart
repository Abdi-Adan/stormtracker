import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stormtracker/blocs/weather_bloc.dart';
import 'package:stormtracker/presentation/pages/home_page.dart';

class StormtrackerApp extends MaterialApp {
  StormtrackerApp({super.key})
      : super(
          home: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => WeatherBloc(),
              )
            ],
            child: const StormtrackerHome(),
          ),
        );
}
