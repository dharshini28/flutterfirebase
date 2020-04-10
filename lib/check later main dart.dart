import 'package:flutter/material.dart';

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
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('user'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {  return MedicalRoute();}),
                );
              },
            ),
            RaisedButton(
              child: Text('medical shop'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {  return MedicalRoute();}),
                );
              },
            ),],
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
