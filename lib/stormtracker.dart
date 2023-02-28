import 'package:flutter/material.dart';
import 'package:stormtracker/utils/app_routes.dart';
import 'package:stormtracker/utils/constants.dart';
import 'package:stormtracker/utils/route_generator.dart';

class Stormtracker extends StatelessWidget {
  const Stormtracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: homePageRoute,
      navigatorKey: globalAppNavigatorKey,
      onGenerateRoute: AppRouterGenerator.generateRoute,
    );
  }
}
