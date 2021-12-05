import 'dart:convert';
import 'dart:io';

import 'package:crypto_api/models/complex_model.dart';
import 'package:flutter/material.dart';
import 'package:crypto_api/models/user_complex_model.dart';
import 'package:http/http.dart' as http;

class APIDemoScreen extends StatefulWidget {
  const APIDemoScreen({Key? key}) : super(key: key);

  @override
  _APIDemoScreenState createState() => _APIDemoScreenState();
}

class _APIDemoScreenState extends State<APIDemoScreen> {
  List<UserModel> jsonList = [];
  List<dynamic> values = [];
  Future<List<UserModel>> getApi() async {
    print('get api called');
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      values = data;
      values.map((e) {
        jsonList.add(UserModel.fromJson(e));
      }).toList();
      print('jsonList values: $jsonList}');
      // return jsonList;

      // return jsonList.add(User.fromJson(data));

    } else {
      print('error occurred');
      //return jsonReturn;

    }
    return jsonList;
  }
  Future<List<UserModel>>? future;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = getApi();
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
            child: FutureBuilder<List<UserModel>>(
              future: future,
              builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                // var values = snapshot.data!.map((e) => e).toList();
                print('snapshot type: ${snapshot.data.runtimeType.toString()}');
                if (!snapshot.hasData) {
                  return Text('Loading...');
                } else {
                  print('jsonList values... $jsonList');
                  print('snapshot values: ${snapshot.data!.first.email}');
                  return ListView.separated(
                    itemCount: snapshot.data!.length,

                    separatorBuilder: (context, index) {
                      return Divider(color: Colors.white,
                      thickness: 10.0,);
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(snapshot.data![index].address!.geo!.lat.toString()),
                          // subtitle: Text(snapshot.data![index].id.toString()),
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