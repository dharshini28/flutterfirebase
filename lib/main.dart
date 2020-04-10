import 'package:flutterfirebase/screens/Enter_a_city.dart';
import 'package:flutterfirebase/screens/places_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        '/': (context) => (Enter_city()),
        '/pharmacies': (context) => PlacesScreen(),
      },
    );
  }
}
