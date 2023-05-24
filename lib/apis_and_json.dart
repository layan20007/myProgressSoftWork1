import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' ;


class anotherPage extends StatefulWidget {
  const anotherPage({Key? key}) : super(key: key);

  @override
  State<anotherPage> createState() => _anotherPageState();
}
class _anotherPageState extends State<anotherPage> {

  Future getData() async{
    var url ='https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('apis and json'),
      ),
      body: FutureBuilder(future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(itemCount: snapshot.data.length, itemBuilder: (context, i) {
              return Container(child: Text(snapshot.data[i]['id'],),);
            });
          }
          return CircularProgressIndicator();

        },

      ),


    );
  }
}