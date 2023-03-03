import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stormtracker/blocs/location/location_bloc.dart';
import 'package:stormtracker/blocs/weather/weather_bloc.dart';
import 'package:stormtracker/presentation/pages/home_page.dart';
import 'package:stormtracker/utils/constants.dart';
import 'package:stormtracker/utils/route_generator.dart';

class StormtrackerApp extends MaterialApp {
  StormtrackerApp({super.key})
      : super(
          home: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => LocationBloc(),
              ),
              BlocProvider(
                create: (context) => WeatherBloc(),
              ),
            ],
            child: const StormtrackerHome(currentCity: ''),
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouterGenerator.generateRoute,
          navigatorKey: globalAppNavigatorKey,
        );
}
