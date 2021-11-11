import 'package:crypto_api/models/albums.dart';
import 'package:crypto_api/services/api_services.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   Future<Albums>? albums;
  // initState method and it call only once
  @override
  void initState() {

    albums = API_Manager().getAlbums();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var i = albums!.then((value) => print(value.userId)).catchError((err){
      print(err);
    });
    print(i);
    return Scaffold(
      appBar: AppBar(
        title: Text('REST API\'s'),
      ),
      body: FutureBuilder<Albums>(
        future: albums,
        builder: (context, snapshot){
         if(!snapshot.hasData){
           return const Center(
             child: CircularProgressIndicator(),
           );
         } else{
           return ListView(
             children: [
               Text(snapshot.data!.userId.toString()),
             ],
           );
         }



        },
      ),
    );
  }
}