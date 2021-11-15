import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  String? name;
  String? symbol;
  String? imageUrl;
  num? currentPrices;
  num? priceChange;
  num? changePercent;

  CoinCard(
      {this.name,
      this.symbol,
      this.imageUrl,
      this.currentPrices,
      this.priceChange,
      this.changePercent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Expanded(
          child: Row(
            children: [
              CircleAvatar(radius: 25, child: Image.network(imageUrl!)),
              Column(
                children: [
                  Text(
                    name!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    symbol!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    currentPrices!.toDouble().toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    currentPrices!.toDouble().toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    changePercent!.toDouble().toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}