// ignore_for_file: non_constant_identifier_names

/*import 'dart:async';
import 'dart:convert';

import 'package:api_consumo/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<Album> updateAlbum(String title) async {
  final response = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update album.');
  }
}

class Album {
  final int id;
  final String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}

class Update extends StatefulWidget {

  @override
  Update({required Key key, List? listrespose}) : super(key: key);

  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _UpdateState extends State<Update> {
  final TextEditingController _controller = TextEditingController();
  _UpdateState({required Key key, required List? listresponse});
  late Future<Album> _futureAlbum;

  get index => null;

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Update Data'+listRespose![index]['id'],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Update Data'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<Album>(
            future: _futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(snapshot.data!.title),
                      TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Enter Title',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _futureAlbum = updateAlbum(_controller.text);
                          });
                        },
                        child: const Text('Update Data'),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home_page.dart';

class EditData extends StatefulWidget {
  final List? list;
  final int index;

  EditData({this.list, required this.index});

  @override
  // ignore: unnecessary_new
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController email;
  late TextEditingController first_name;
  late TextEditingController last_name;
  late TextEditingController avatar;
  late TextEditingController id;

  void editData() {
    var url = "https://backend-consumo.herokuapp.com/users/" +
        widget.list![widget.index]['id'].toString();
    http.put(Uri.parse(url), body: {
      "email": email.text,
      "first_name": first_name.text,
      "last_name": last_name.text,
      "avatar": avatar.text
    });
  }

  @override
  void initState() {
    email =
        TextEditingController(text: widget.list![widget.index]['email']);
    first_name =
        TextEditingController(text: widget.list![widget.index]['first_name']);
    last_name =
        TextEditingController(text: widget.list![widget.index]['last_name']);
    avatar =
        TextEditingController(text: widget.list![widget.index]['avatar']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  const Text("EDITAR USUARIOS"),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
             Column(
              children: <Widget>[
                 ListTile(
                  title:  TextFormField(
                    controller: email,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      labelText: "CORREO",
                    ),
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                 ListTile(
                  title:  TextFormField(
                    controller: first_name,
              
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(

                      labelText: "NOMBRE",
                    ),
                  ),
                ),
                 ListTile(
                  title:  TextFormField(
                    controller: last_name,
               
                    // ignore: prefer_const_constructors
                    decoration:  InputDecoration(
                      labelText: "APELLIDO",
                    ),
                  ),
                ),
                 ListTile(
                  title:  TextFormField(
                    controller: avatar,               
                    // ignore: prefer_const_constructors
                    decoration:  InputDecoration(
                      labelText: "IMAGEN",
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                ),
                // ignore: deprecated_member_use
                 RaisedButton(
                  child: const Text("EDITAR"),
                  color: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    editData();
                    Navigator.of(context).push( MaterialPageRoute(
                        builder: (BuildContext context) =>   HomePage()));
                  },
                ),
                 // ignore: deprecated_member_use
                 RaisedButton(
                    child:  const Text("ELIMINAR"),
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                      
                      var url = "https://backend-consumo.herokuapp.com/users/" +
                          widget.list![widget.index]['id'].toString();
                      http.delete(Uri.parse(url));
           Navigator.of(context).push( MaterialPageRoute(
                        builder: (BuildContext context) =>  HomePage()));
                    }
                    
                    
                    )
                    ,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
