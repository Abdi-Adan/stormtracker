import 'package:flutter/material.dart';
import 'package:stormtracker/blocs/weather_state.dart';
import 'package:stormtracker/presentation/widgets/day_widget.dart';
import 'package:stormtracker/presentation/widgets/forecast_variation_bar.dart';
import 'package:stormtracker/presentation/widgets/waves_pattern.dart';
import 'package:stormtracker/utils/app_utils.dart';

// ignore: must_be_immutable
class ForecastSection extends StatelessWidget {
  WeatherLoaded state;

  ForecastSection({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.lightBlue,
      height: (MediaQuery.of(context).size.height * 0.60),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 10),
          const WavesPattern(),
          const SizedBox(height: 10),
          ForecastVariationBar(state: state),
          ListView.builder(
            shrinkWrap: true,
            itemCount: state.forecasts.length,
            itemBuilder: (context, index) {
              final item = state.forecasts[index];
              WeatherIconType iconType =
                  enumFromString(state.forecasts[index].main.toLowerCase());
              WeatherStatus status = iconType.status;

              return DayWidget(
                dayOfWeek: item.date,
                dayTemp: item.temp.toInt().toString(),
                statusIcon: status.icon,
              );
            },
          ),
        ],
      ),
    );
  }
}
