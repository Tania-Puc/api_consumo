// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, duplicate_ignore
/*
import 'package:api_consumo/update_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'login_page.dart';

String? stringRespose;
List? mapRespose;
Map? dataRespose;
List? listRespose;

class HomePage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  @override
  _HomePageState createState() => _HomePageState();
  HomePage({Key? key, required this.id}) : super(key: key);
  final int id;


}

class _HomePageState extends State<HomePage> {
  Future apicall() async {
    http.Response response;
    response = await http
        .get(Uri.parse("http://192.168.3.107:3000/users/" + id.toString()));
    if (response.statusCode == 200) {
      setState(() {
        stringRespose = response.body;
        mapRespose = json.decode(response.body);
        listRespose = mapRespose;
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                    /*currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.network(avatar.toString()),
                    ),*/
                    accountName: Text(id.toString()),
                    accountEmail: Text(id.toString()))
              ],
            ),
          ),
          appBar: AppBar(
            title: Text('Consumo de API'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/agregar',
              );
            },
            child: Icon(Icons.add),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                  width: width * 0.8,
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => EditData(
                                list: listRespose,
                                index: index,
                              )),
                    ),
                    child: Card(
                      color: Colors.blue,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(listRespose![0]['avatar']),
                            ),
                            Visibility(
                              child: Text(listRespose![0]['id'].toString()),
                              visible: false,
                            ),
                            Text(listRespose![0]['email'].toString()),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      listRespose![0]['first_name'].toString(),
                                      textAlign: TextAlign.end),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                      listRespose![0]['last_name'].toString(),
                                      textAlign: TextAlign.start),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
            },
            itemCount: listRespose == null ? 0 : listRespose!.length,
          )),
    );
  }
}
*/

import 'package:api_consumo/add_page.dart';
import 'package:api_consumo/login_page.dart';
import 'package:api_consumo/update_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  Home({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  // ignore: unnecessary_new
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getData() async {
    final response = await http
        .get(Uri.parse("http://192.168.3.107:3000/users/" + id.toString()));
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
        title: 'Material App',
        home: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 50.0,
                      ),
                    ),
                    accountName: Text('text'),
                    accountEmail: Text('ejemplo'))
              ],
            ),
          ),
          appBar: AppBar(
            // ignore: prefer_const_constructors
            title: Text('Security App'),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => AddData(),
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
                    id: id,
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
  final int id;
  // ignore: use_key_in_widget_constructors
  ItemList({this.list,required this.id});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        return Container(
          color: Colors.white,
          width: width * 8.0,
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => EditData(
                        list: list!,
                        index: i,
                        id:id
                      )),
            ),
            child: Card(
              color: Colors.blue,
              child: Container(
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
