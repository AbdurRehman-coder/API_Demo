import 'dart:convert';
import 'package:crypto_api/models/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class API_Manager {
  static const String url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false";


  static Future<List<Crypto>> getApi() async{
      List<Crypto> coinList = [];
    var response = await http.get(Uri.parse(url));
    // if(response.statusCode == 200) {
      List<dynamic> values = [];
      var jsonString = response.body;
      values = jsonDecode(jsonString);
      print('values length: ${values.length.toString()}');
       if(values.isNotEmpty) {
         return values.map((e) => Crypto.fromJson(e)).toList();
       } else{
      throw Exception('Failed to fetch data');
    }

    // return coinList;
  }


}