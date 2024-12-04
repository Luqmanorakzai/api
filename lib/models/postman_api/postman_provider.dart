import 'dart:convert';
import 'package:api/models/postman_api/postman_api_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PostmanProvider extends ChangeNotifier {
  List<PostModel> postList = [];
  Future<List<PostModel>> getPostData() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var postmanData = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var data in postmanData) {
        postList.add(PostModel.fromJson(data));
      }
      notifyListeners();
      return postList;
    } else {
      notifyListeners();
      return postList;
    }
  }
}
