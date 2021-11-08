
// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:api_consumo/add_page.dart';
import 'package:api_consumo/update_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  // ignore: unnecessary_new
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List> getData() async {
    final response = await http
        .get(Uri.parse("https://backend-consumo.herokuapp.com/users/"));
    return json.decode(response.body);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Usuario',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Usuario'),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              // ignore: unnecessary_new
              builder: (BuildContext context) => new AddData(),
            )),
          ),
          body: FutureBuilder<List>(
            future: getData(),
            builder: (context, snapshot) {
              // ignore: avoid_print
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  // ignore: unnecessary_new
                  ? new ItemList(
                      list: snapshot.data,
                    )
                  // ignore: unnecessary_new
                  : new Center(
                      // ignore: unnecessary_new
                      child: new CircularProgressIndicator(),
                    );
            },
          ),
        ));
  }
}



class ItemList extends StatelessWidget {
  final List? list;
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        return  Container(
          color: Colors.white,
          width: width * 8.0,
          child:  GestureDetector(
            onTap: () => Navigator.of(context).push(
               MaterialPageRoute(
                  builder: (BuildContext context) =>  EditData(
                        list: list!,
                        index: i,
                      )),
            ),
            child:  Card(
              color: Colors.blue,
              child: Container(
                // ignore: prefer_const_constructors
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(list![i]['avatar']),
                    ),
                    Visibility(
                      child: Text(list![i]['id'].toString()),
                      visible: false,
                    ),
                    Text(list![i]['email'].toString()),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(list![i]['first_name'].toString(),
                              textAlign: TextAlign.end),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(list![i]['last_name'].toString(),
                              textAlign: TextAlign.start),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
