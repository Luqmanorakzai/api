import 'dart:convert';
import 'package:api/models/photo_api/photo_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhotoProvider extends ChangeNotifier {
  // fist get the photo objects in empty list
  List<Photos> photosList = [];
  //create a function to get all photo api data
  Future<List<Photos>> getPhotoData() async {
    //now first get url
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    // now convert the data into dart format using decode method store in a variable
    var photoData = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      //while data is more use for each or for in loop
      for (var data in photoData) {
        //add photo data in list using photoModel
        photosList.add(Photos.fromJson(data));
      }
      notifyListeners();
      return photosList;
    } else {
      notifyListeners();
      return photosList;
    }
  }
}
