import 'dart:convert';

import 'package:crypto_api/models/albums.dart';
import 'package:crypto_api/models/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class API_Manager {
  //static final String key = '67ea72e9c43d259dee17dec18b5bc593ee1a89c5';
 // static  String bitcoinUrl = "https://api.nomics.com/v1/currencies/ticker?key=$key&ids=BTC,ETH,XRP&interval=1d,30d&convert=USD&per-page=100&page=1";
 // static const String cryptoUrl = 'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH&tsyms=USD,EUR';
  static const String url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false";


  static Future<List<Crypto>?> getApi() async{
      List<Crypto> coinList = [];
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      List<dynamic> values = [];
      var jsonString = response.body;
      values = jsonDecode(jsonString);
      if(values.isNotEmpty){
        for(int i = 0; i<values.length; i++){
          if(values[i] != null){
            Map<String, dynamic> map = values[i];
            coinList.add(Crypto.fromJson(map));
          }
        }
      }


    } else{
      throw Exception('Failed to fetch data');
    }
    // var jsonMap = jsonDecode(response.body);
    // print(jsonMap);
     return coinList;
  }


}