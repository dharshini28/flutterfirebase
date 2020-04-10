import 'dart:async';
import "dart:convert";

import 'package:http/http.dart' as http;

import '../models/place_model.dart';

class PlacesService {
  static final _service = new PlacesService();

  static PlacesService get() {
    return _service;
  }

  final String searchUrl =
      "https://maps.googleapis.com/maps/api/place/textsearch/json?query=pharmacies+in+Chennai&key=AIzaSyCJkgrtKxjEDCwmTbEU0dOaiNOUlIlBFyo";

  Future<List<Place>> getTextSearch() async {
    var reponse =
        await http.get(searchUrl, headers: {"Accept": "application/json"});
    var places = <Place>[];

    List data = json.decode(reponse.body)["results"];

    data.forEach((f) => places.add(new Place(f["place_id"], f["name"])));

    return places;
  }
}
