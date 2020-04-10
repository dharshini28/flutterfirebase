import 'package:flutterfirebase/screens/Enter_a_city.dart';
import 'package:flutterfirebase/screens/places_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: 'Homepage',
    home: FirstRoute(),

  ));
}

class FirstRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(150.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  child: Text('user'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {  return Pharmacies();}),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:50),
                child: FloatingActionButton(
                  child: Text('Pharmacy'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {  return MedicalRoute();}),
                    );
                  },
                ),
              ),],
          ),
        ),
      ),

    );
  }
}

class MedicalRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class Pharmacies extends StatelessWidget {
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
