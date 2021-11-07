// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, unnecessary_new, duplicate_ignore

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

import 'package:api_consumo/login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home_page.dart';

class EditData extends StatefulWidget {
  final List? list;
  final int index;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  EditData({this.list, required this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController controlleremail;
  late TextEditingController controllerpass;
  late TextEditingController controllerfirst_name;
  late TextEditingController controllerlast_name;
  late TextEditingController controlleravatar;
  late TextEditingController controllerid;

  void editData() {
    var url = "http://192.168.3.107:3000/users/" +
        widget.list![widget.index]['id'].toString();
    // ignore: avoid_print
    print(url);
    http.put(Uri.parse(url), body: {
      "email": controlleremail.text,
      "pass":controllerpass.text,
      "first_name": controllerfirst_name.text,
      "last_name": controllerlast_name.text,
      "avatar": controlleravatar.text
    });
  }

  @override
  void initState() {
    controlleremail =
        TextEditingController(text: widget.list![widget.index]['email']);
            controllerpass =
        TextEditingController(text: widget.list![widget.index]['pass']);
    controllerfirst_name =
        TextEditingController(text: widget.list![widget.index]['first_name']);
    controllerlast_name =
        TextEditingController(text: widget.list![widget.index]['last_name']);
    controlleravatar =
        TextEditingController(text: widget.list![widget.index]['avatar']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  const Text("EDITAR"),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                 ListTile(
                  leading: const Icon(Icons.email, color: Colors.black),
                  title:  TextFormField(
                    controller: controlleremail,
                    validator: (value) {
                      if (value!.isEmpty) return "Ingresa un email";
                    },
                    decoration:  const InputDecoration(
                      hintText: "Email",
                      labelText: "email",
                    ),
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                                 ListTile(
                  leading: const Icon(Icons.email, color: Colors.black),
                  title:  TextFormField(
                    controller: controllerpass,
                    validator: (value) {
                      if (value!.isEmpty) return "Ingresa contraseña";
                    },
                    decoration:  const InputDecoration(
                      hintText: "contraseña",
                      labelText: "contraseña",
                    ),
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                 ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title:  TextFormField(
                    controller: controllerfirst_name,
                    validator: (value) {
                      if (value!.isEmpty) return "Ingrese su primer nombre";
                    },
                    decoration:  const InputDecoration(
                      hintText: "First name",
                      labelText: "First name",
                    ),
                  ),
                ),
                 ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title:  TextFormField(
                    controller: controllerlast_name,
                    validator: (value) {
                      if (value!.isEmpty) return "Ingresa su apellido";
                    },
                    decoration:  const InputDecoration(
                      hintText: "Last name",
                      labelText: "Last name",
                    ),
                  ),
                ),
                 ListTile(
                  leading: const Icon(Icons.image_rounded, color: Colors.black),
                  title:  TextFormField(
                    controller: controlleravatar,
                    validator: (value) {
                      if (value!.isEmpty) return "Ingresa una url de imagen";
                    },
                    decoration:  const InputDecoration(
                      hintText: "Url imagen",
                      labelText: "Url imagen",
                    ),
                  ),
                ),
                 const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                 // ignore: deprecated_member_use
                 RaisedButton(
                  child:  const Text("Guardar"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Home(id:id)));
                  },
                ),
                 // ignore: deprecated_member_use
                 RaisedButton(
                    child:  const Text("Borrar"),
                    color: Colors.red,
                    onPressed: () {
                      var url = "http://192.168.3.107:3000/users/" +
                          widget.list![widget.index]['id'].toString();
                      // ignore: avoid_print
                      print(url);
                      http.delete(Uri.parse(url));
           // ignore: unnecessary_new
           Navigator.of(context).push(new MaterialPageRoute(
                        // ignore: unnecessary_new
                        builder: (BuildContext context) => new Home(id:id)));




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
