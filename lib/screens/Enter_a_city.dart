import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Enter_city extends StatefulWidget {
  @override
  State createState() => new Enter_cityState();
}

class Enter_cityState extends State<Enter_city> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Enter City"),
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Enter city',
                    fillColor: Colors.black,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter City';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 30,
                    bottom: 0,
                    right: 20,
                  ),
                ),
                FloatingActionButton(
                  child: Icon(Icons.navigation),
                  backgroundColor: Colors.green,
                  onPressed: () {
                    Navigator.pushNamed(context, '/pharmacies');
                  },
                )
              ],
            ),
          ),
        ));
  }
}
