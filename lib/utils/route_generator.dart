// Flutter imports:
import 'package:flutter/material.dart';
import 'package:stormtracker/presentation/pages/home_page.dart';
import 'package:stormtracker/utils/app_routes.dart';

class AppRouterGenerator {
  static Route<dynamic>? generateRoute(RouteSettings? settings) {
    final dynamic args = settings?.arguments;

    switch (settings?.name) {
      case homePageRoute:
        return MaterialPageRoute<StormtrackerHome>(
            builder: (_) => StormtrackerHome(
                  currentCity: args,
                ));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<StormtrackerHome>(
      builder: (_) => const StormtrackerHome(currentCity: 'Nairobi'),
    );
  }
}
