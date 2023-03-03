import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stormtracker/stormtracker.dart';

void main() async {
  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // 1. Ensure all app data is cached to firebase firestore db
    // await Firebase.initializeApp();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    runApp(StormtrackerApp());
  }, (Object exception, StackTrace stackTrace) {
    if (!kReleaseMode) {
      // Would otherwise fail static analysis. This is just a temporary provision.
      // ignore: avoid_print
      print('$exception -=- $stackTrace');
    }
  });
}
