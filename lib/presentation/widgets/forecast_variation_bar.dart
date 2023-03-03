import 'package:flutter/material.dart';
import 'package:stormtracker/blocs/weather_state.dart';
import 'package:stormtracker/presentation/widgets/forecast_variation_item.dart';

class ForecastVariationBar extends StatelessWidget {
  final WeatherLoaded state;

  const ForecastVariationBar({
    super.key, required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ForecastVariationItem(temp: state.weather.tempMin.toInt().toString(),),
            ForecastVariationItem(temp: state.weather.temp.toInt().toString(),),
            ForecastVariationItem(temp: state.weather.tempMax.toInt().toString(),),
          ],
        ),
        const Divider(color: Colors.white),
      ]),
    );
  }
}
