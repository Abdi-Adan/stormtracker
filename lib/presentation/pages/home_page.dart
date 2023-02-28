import 'package:flutter/material.dart';
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
      body: Stack(
        children: [
          Column(
            children: const [
              CurrentForecast(),
              ForecastSection(),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.17,
            right: 10,
            child: const LightHouse(),
          )
        ],
      ),
    );
  }
}
