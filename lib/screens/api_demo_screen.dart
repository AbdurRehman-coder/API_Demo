import 'dart:convert';
import 'dart:io';

import 'package:crypto_api/models/complex_model.dart';
import 'package:crypto_api/models/json_place_holder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIDemoScreen extends StatefulWidget {
  const APIDemoScreen({Key? key}) : super(key: key);

  @override
  _APIDemoScreenState createState() => _APIDemoScreenState();
}

class _APIDemoScreenState extends State<APIDemoScreen> {
  List<ComplexModel> jsonList = [];

  Future<List<ComplexModel>> getApi() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body);
    if(response.statusCode == 200){
      for(Map i in data){
        var mapData = ComplexModel.fromJson(i);
        jsonList.add(mapData);
      }
      return jsonList;
    }else{
      print('error occurred');

    }
   return jsonList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<ComplexModel>>(
              future: getApi(),
              builder: (context, snapshot) {
                // var values = snapshot.data!.map((e) => e).toList();
                if (!snapshot.hasData) {
                  return Text('Loading...');
                } else {
                  print('jsonList values... $jsonList');
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(snapshot.data![index].website.toString()),
                          subtitle: Text(snapshot.data![index].id.toString()),
                          tileColor: Colors.white,
                        ),
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

class Comments{
  String? name;
  String? email;
  int? id;
  Comments({this.id, this.name, this.email});
}