import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

final GlobalKey<NavigatorState> globalAppNavigatorKey =
    GlobalKey<NavigatorState>();

/// Defaults to Nairobi
Position defaultAppPosition = Position(
  longitude: 36.8523123,
  latitude: -1.272813,
  timestamp: DateTime.now(),
  accuracy: 39.599998474121094,
  altitude: 1629.5999755859375,
  heading: 0.0,
  speed: 0.0,
  speedAccuracy: 0.0,
);
