import 'package:flutter/material.dart';
import 'package:stormtracker/blocs/weather/weather_state.dart';
import 'package:stormtracker/presentation/widgets/custom_appbar.dart';
import 'package:stormtracker/utils/app_utils.dart';

// ignore: must_be_immutable
class CurrentForecast extends StatefulWidget {
  WeatherLoaded state;

  CurrentForecast({
    super.key,
    required this.state,
  });

  @override
  State<CurrentForecast> createState() => _CurrentForecastState();
}

class _CurrentForecastState extends State<CurrentForecast> {
  @override
  Widget build(BuildContext context) {
    WeatherIconType iconType =
        enumFromString(widget.state.weather.main.toLowerCase());
    WeatherStatus status = iconType.status;

    return Container(
      width: double.infinity,
      height: (MediaQuery.of(context).size.height * 0.40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            status.backgroundColor.first,
            status.backgroundColor.last,
          ],
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: CustomAppbar(
              cityName: widget.state.weather.cityName,
              isFavourited: false,
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Icon(
                    // Icons.sunny,
                    status.icon,
                    size: 100,
                    color: status.iconColor,
                  ),
                ),
                const SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.state.weather.temp.toInt()} ℃',
                      style: const TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontFamily: 'Lato',
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      widget.state.weather.main.toString().toUpperCase(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
