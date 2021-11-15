import 'dart:convert';

import 'package:crypto_api/models/albums.dart';
import 'package:crypto_api/models/crypto_model.dart';
import 'package:crypto_api/services/api_services.dart';
import 'package:crypto_api/widgets/coin_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Future<List<Albums>>? listAlbums;

  Future<List<Crypto>?>? cryptoMap;

  // initState method and it call only once
  @override
  void initState() {
    //albums = API_Manager().getAlbums();
    super.initState();
    // listAlbums = API_Manager.getApi();
    cryptoMap = API_Manager.getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(11, 12, 54, 5),
      appBar: AppBar(
        title: Text('REST API\'s'),
      ),
      body: FutureBuilder<List<Crypto>?>(
        //initialData: listAlbums,
        future: cryptoMap,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // return Text('${snapshot.data![2].title}');
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
              return CoinCard(
                name: snapshot.data![index].name,
                symbol: snapshot.data![index].symbol,
                imageUrl: snapshot.data![index].image,
                currentPrices: snapshot.data![index].currentPrice,
                priceChange: snapshot.data![index].priceChange24h,
                changePercent: snapshot.data![index].priceChangePercentage24h,
              );
              },
            );
          } else if (snapshot.hasError) {
            return Text('error type are: ${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}