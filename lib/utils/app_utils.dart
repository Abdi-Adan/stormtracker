/// In this file we have switch cases, typedefs, enums and other globally usable and shared utilities for the entire app aside from strings, constants and routes
import 'package:flutter/material.dart';

enum WeatherIconType {
  clear,
  rain,
  clouds,
}

WeatherIconType enumFromString(String value) {
  return WeatherIconType.values.firstWhere((e) => e.toString().split('.').last == value);
}

extension IconTypeExtension on WeatherIconType {
  WeatherStatus get status {
    switch (this) {
      case WeatherIconType.clear:
        return WeatherStatus(
          backgroundColor: [Colors.orangeAccent, Colors.deepOrange],
          iconColor: Colors.yellow,
          icon: Icons.sunny,
        );
      case WeatherIconType.rain:
        return WeatherStatus(
          backgroundColor: [const Color(0xff040D3E), Colors.blue],
          iconColor: Colors.white,
          icon: Icons.thunderstorm,
        );
      case WeatherIconType.clouds:
        return WeatherStatus(
          backgroundColor: [const Color(0xffECECEC), const Color(0xffBEBEBE)],
          iconColor: Colors.lightBlueAccent,
          icon: Icons.cloud,
        );
      default:
        return WeatherStatus(
          backgroundColor: [Colors.orange, Colors.deepOrange],
          iconColor: Colors.yellow,
          icon: Icons.sunny,
        );
    }
  }
}

class WeatherStatus {
  final IconData icon;
  final Color iconColor;
  final List<Color> backgroundColor;

  WeatherStatus({
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  });
}
