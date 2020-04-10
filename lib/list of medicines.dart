import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(MaterialApp(
    title: 'Homepage',
    home: UserRoute(),
  ));
}

class UserRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView SearchView",
      home: new Home(),
      theme: ThemeData(primaryColor: Colors.lightGreen),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final dbref = FirebaseDatabase.instance.reference();
  var _searchview = new TextEditingController();

  bool _firstSearch = true;
  String _query = "";

  List<String> medicines;
  List<String> _filterList;

  @override
  void initState() {
    super.initState();
    medicines = new List<String>();
    medicines = [
      'medicine one',
      'medicine two',
      'medicine three',
      'medicine four',
      'medicine five',
      'medicine six',
      'medicine seven',
      'medicine eight',
      'medicine nine',
      'medicine ten',
      'medicine eleven',
      'medicine twelve',
      'medicine thirtheen',
      'medicine fourteen',
      'medicine fifteen',
      'medicine sixteen',
      'medicine seventeen',
    ];
  }

  _HomeState() {
    //Register a closure to be called when the object changes.
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        //Notify the framework that the internal state of this object has changed.
        setState(() {
          _firstSearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _firstSearch = false;
          _query = _searchview.text;
        });
      }
    });
  }

//Build our Home widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Medicines"),
      ),
      body: new Container(
        color: Colors.black,
        child: new Column(
          children: <Widget>[
            _createSearchView(),
            _firstSearch ? _createListView() : _performSearch(),
            RaisedButton(
              onPressed: writedata(),
              textColor: Colors.black,
              splashColor: Colors.lightGreen,
              child: Text(
                  "SUBMIT", style: TextStyle(fontStyle: FontStyle.italic)),)
          ],
        ),
      ),
    );
  }

  //Create a SearchView
  Widget _createSearchView() {
    return new Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: new TextField(
        controller: _searchview,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: new TextStyle(color: Colors.white),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  List<int> _counter = List();
  List<int> _counter1 = List();

  //Create a ListView widget
  Widget _createListView() {
    return new Flexible(
      child: ListView.builder(

          itemCount: medicines.length,
          itemBuilder: (context, index) {
            if (_counter.length < medicines.length) {
              _counter.add(0);
            }

            return Padding(
              padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10,
                  top: 10,
                  bottom: 10),
              child: Card(
                color: Colors.lightGreen[100],
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 30,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Column(children: <Widget>[
                          Center(child: Text(medicines[index])),
                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: <Widget>[
                          new FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                _counter[index] = _counter[index] + 1;
                              });
                            },
                            child: new Icon(Icons.add, color: Colors.black,),
                            backgroundColor: Colors.white,),
                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: <Widget>[
                          new Text('${_counter[index]}',
                              style: new TextStyle(fontSize: 30.0)),
                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: <Widget>[
                          new FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (_counter[index] > 0) {
                                  _counter[index] = _counter[index] - 1;
                                }
                              });
                            },
                            child: new Icon(
                                const IconData(
                                    0xe15b, fontFamily: 'MaterialIcons'),
                                color: Colors.black),
                            backgroundColor: Colors.white,),
                        ],),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  //Perform actual search
  Widget _performSearch() {
    _filterList = new List<String>();
    for (int index = 0; index < medicines.length; index++) {
      if (medicines[index].toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(medicines[index]);
        _counter1.add(_counter[index]);
      }
    }
    return _createFilteredListView();
  }

  //Create the Filtered ListView
  Widget _createFilteredListView() {
    return new Flexible(
      child: ListView.builder(

          itemCount: _filterList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10,
                  top: 10,
                  bottom: 10),
              child: Card(
                color: Colors.lightGreen[100],
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 30,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Column(children: <Widget>[
                          Center(child: Text("${_filterList[index]}"
                          ),
                          )
                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: <Widget>[
                          new FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                _counter1[index] = _counter1[index] + 1;
                              });
                            },
                            child: new Icon(Icons.add, color: Colors.black,),
                            backgroundColor: Colors.white,),
                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: <Widget>[
                          new Text("${_counter1[index]}"),
                        ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: <Widget>[
                          new FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (_counter[index] > 0) {
                                  _counter1[index] = _counter1[index] - 1;
                                }
                              });
                            },
                            child: new Icon(
                                const IconData(
                                    0xe15b, fontFamily: 'MaterialIcons'),
                                color: Colors.black),
                            backgroundColor: Colors.white,),
                        ],),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }


  writedata() {
    dbref.child('pharmacy name').set({
      'medicine name': 'quantity'
  });
}
}

