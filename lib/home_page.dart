/*import 'dart:html';

import 'package:api_consumo/update_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String? stringRespose;
List? mapRespose;
Map? dataRespose;
List? listRespose;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future apicall() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://backend-consumo.herokuapp.com/users"));
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
                child: Card(
                  color: Colors.blue,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(listRespose![index]['avatar']),
                        ),
                        Visibility(
                          child: Text(listRespose![index]['id'].toString()),
                          visible: false,
                        ),
                        Text(listRespose![index]['email'].toString()),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  listRespose![index]['first_name'].toString(),
                                  textAlign: TextAlign.end),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                  listRespose![index]['last_name'].toString(),
                                  textAlign: TextAlign.start),
                            ),
                          ],
                        ),
                       
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: listRespose == null ? 0 : listRespose!.length,
          )),
    );
  }
}
*/
import 'package:api_consumo/add_page.dart';
import 'package:api_consumo/update_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
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
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Consumo de API'),
          ),
          floatingActionButton: new FloatingActionButton(
            child: new Icon(Icons.add),
            onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new AddData(),
            )),
          ),
          body: new FutureBuilder<List>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? new ItemList(
                      list: snapshot.data,
                    )
                  : new Center(
                      child: new CircularProgressIndicator(),
                    );
            },
          ),
        ));
  }
}

/*
new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Listado Usuarios"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new AddData(),
        )),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
 */

class ItemList extends StatelessWidget {
  final List? list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return new ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        return new Container(
          color: Colors.white,
          width: width * 8.0,
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context) => new EditData(
                        list: list!,
                        index: i,
                      )),
            ),
            child: new Card(
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