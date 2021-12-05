import 'dart:convert';
import 'package:crypto_api/models/products_list.dart';
import 'package:flutter/material.dart';
import'package:http/http.dart' as http;

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ///Api end hitting, with Future method
  Future<ProductsList> fetchAPI() async {
    List<ProductsList> value = [];
    final response = await http.get(
        Uri.parse('https://webhook.site/ef02d295-a35c-49ed-badc-50bd5b9fafcb'));
    var json = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductsList.fromJson(json);
    } else {
      throw Exception('No response from server');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('object from api'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ProductsList>(
              future: fetchAPI(),
              builder: (context, snapshot) {
                //print('${snapshot.data!.data![0].images![0].url}');
                  if(!snapshot.hasData){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else{
                    return ListView.builder(
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 400,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: (snapshot.data!.data![index] == 1) ? Axis.vertical : Axis.horizontal,
                                // shrinkWrap: true,
                                itemCount: snapshot.data!.data![index].images!.length,
                                itemBuilder: (context, position){
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 150,
                                      width: 250,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              snapshot.data!.data![index].images![position].url.toString()
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        snapshot.data!.data![index].title.toString()
                                      ),
                                    ),
                                  );

                                },
                              ),
                            ),
                          ],
                        );
                      },
                    );

                  }
              },
            ),
          ),
        ],
      ),
    );
  }
}