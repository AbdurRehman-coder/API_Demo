import 'dart:convert';

import 'package:crypto_api/models/albums.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class API_Manager {
  static const String url = "https://jsonplaceholder.typicode.com/albums";

  Future<Albums> getAlbums() async {
    //var client = http.Client();
    var newAlbums;

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newAlbums = Albums.fromJson(jsonMap);
      }
    } catch (exception) {
      print('error occurred in code: $exception');
     // return newAlbums;
    }

    return newAlbums;
  }
}