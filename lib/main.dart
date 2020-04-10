import 'package:flutter/cupertino.dart';
import 'package:flutterfirebase/screens/Enter_a_city.dart';
import 'package:flutterfirebase/screens/pharmacies_in_city.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Pharmaciespage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Homepage',
    home: Home(),

  ));
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('APP MEDICA'),
      ),
      body: Container(
        color:  Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: <Widget>[
            Container(
              width: 250,
             height: 450,
             decoration: new BoxDecoration(
             image: new DecorationImage(
             image: new AssetImage("assests/corona.png"),
               fit: BoxFit.fill,
        )
      ),),
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(
                          top: 40,
                          right: 30,
                          left:30
                        ),
                        child: InkWell(
                            child: Container(
                              height: 30,
                              width: 60,
                              color: Colors.lightGreenAccent,
                              child: Center(child: Text('USERS')),),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {  return MedicalRoute();}));}
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 40,
                            right: 30,
                            left:30
                        ),
                        child: InkWell(
                            child: Container(
                              height: 30,
                              width: 110,
                              color: Colors.lightGreenAccent,
                              child: Center(child: Text('PHARMACIES')),),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {  return Pharmaciespage();}));}
                        )
                    ),
                  ],
                ),
              ),
              ],
          ),
        ),
      ),

    );
  }
}

class MedicalRoute extends StatelessWidget {
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
