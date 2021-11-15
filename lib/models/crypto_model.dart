// To parse this JSON data, do
//
//     final crypto = cryptoFromJson(jsonString);

import 'dart:convert';

Map<String, Crypto> cryptoFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, Crypto>(k, Crypto.fromJson(v)));

String cryptoToJson(Map<String, Crypto> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Crypto {
  String? symbol;
  String? name;
  String? image;
  num? currentPrice;
  num? priceChange24h;
  num? priceChangePercentage24h;

  Crypto(
      {this.symbol,
        this.name,
        this.image,
        this.currentPrice,
        this.priceChange24h,
        this.priceChangePercentage24h});

  Crypto.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    name = json['name'];
    image = json['image'];
    currentPrice = json['current_price'];
    priceChange24h = json['price_change_24h'];
    priceChangePercentage24h = json['price_change_percentage_24h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['image'] = this.image;
    data['current_price'] = this.currentPrice;
    data['price_change_24h'] = this.priceChange24h;
    data['price_change_percentage_24h'] = this.priceChangePercentage24h;
    return data;
  }
}