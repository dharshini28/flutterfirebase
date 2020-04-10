import 'package:flutterfirebase/list of medicines.dart';
import 'package:flutterfirebase/models/place_model.dart';
import 'package:flutterfirebase/services/place_service.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatefulWidget {
  @override
  State createState() => new PlacesScreenState();
}

class PlacesScreenState extends State<PlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text("Pharmacies in Chennai"),
        backgroundColor: Colors.green,
      ),
      body: _createcontent(),
    );
  }

  List<Place> _places;
  List<Place> pharmacies;
  @override
  void initState() {
    super.initState();

    PlacesService.get().getTextSearch().then((data) {
      this.setState(() {
        _places = data;
      });
    });
  }

  Widget _createcontent() {
    if (_places == null) {
      return new Center(
        child: Text("null"),
      );
    } else {
      return new ListView(
        children: _places.map((f) {
          return new ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {  return Home();}),
              );
            },
            title: new Text(
              f.name,
              style: TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
      );
    }
  }
}
