// ignore_for_file: use_key_in_widget_constructors

/*import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;*/

/*Future<Album> createAlbum(
    String email, String first_name, String last_name, String avatar) async {
  final response = await http.post(
    Uri.parse('https://backend-consumo.herokuapp.com/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'first_name': first_name,
      'last_name': last_name,
      'avatar': avatar,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  Album(
      {required this.id,
      required this.email,
      required this.first_name,
      required this.last_name,
      required this.avatar});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        id: json['id'],
        email: json['email'],
        first_name: json['first_name'],
        last_name: json['last_name'],
        avatar: json['avatar']);
  }
}*/
/*

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final email = TextEditingController();
  final first_name = TextEditingController();
  final last_name = TextEditingController();
  final avatar = TextEditingController();
  @override
  void dispose() {
    // del TextField!
    /*Ya que el TextField no tiene un ID como en Android, el texto no puede ser recuperado sobre demanda, en su lugar debe ser guardado en una variable al ser cambiado o usar un controlador. */
    email.dispose();
    first_name.dispose();
    last_name.dispose();
    avatar.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: buildColumn(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: email,
          decoration: const InputDecoration(hintText: 'Enter your email'),
        ),
        TextField(
          controller: first_name,
          decoration: const InputDecoration(hintText: 'Enter First name'),
        ),
        TextField(
          controller: last_name,
          decoration: const InputDecoration(hintText: 'Enter Last name'),
        ),
        TextField(
          controller: avatar,
          decoration: const InputDecoration(hintText: 'Enter your url avatar'),
        ),
        ElevatedButton(
          onPressed: () {
            createAlbum(
                email.text, first_name.text, last_name.text, avatar.text);
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }
}*/

/*
class Usuario {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  Usuario(
      {required this.id,
      required this.email,
      required this.first_name,
      required this.last_name,
      required this.avatar});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      email: json['email'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

int parsePost(String responseBody) {
  //final parsed = json.decode(responseBody).cast<Map<int, dynamic>>();
  //solo devuelve un uno o un cero es de la siguiente manera
  final int parsed = json.decode(responseBody);
  return parsed;
}

fetchPost2(BuildContext context, String email, String first_name,
    String last_name, String avatar) async {
  final response = await http.get(Uri.parse(
      'http://consumoapi.somee.com/WebServices.asmx/Guardar?email=$email&firts_name=$last_name&last_name=$last_name&correo=$avatar'));
  print(response);
  if (response.statusCode == 200) {
    int lista = parsePost(response.body);
    print(lista);
    if (lista > 0) {
      Navigator.pushNamed(context, '/signup');
    } else {
      Navigator.pushNamed(context, '/');
    }
    return lista;
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

*/

/*Future<Album> createAlbum(
    String email, String first_name, String last_name, String avatar) async {
  final response = await http.post(
    Uri.parse('https://backend-consumo.herokuapp.com/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'first_name': first_name,
      'last_name': last_name,
      'avatar': avatar,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  Album(
      {required this.id,
      required this.email,
      required this.first_name,
      required this.last_name,
      required this.avatar});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        id: json['id'],
        email: json['email'],
        first_name: json['first_name'],
        last_name: json['last_name'],
        avatar: json['avatar']);
  }
}*/

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home_page.dart';

class AddData extends StatefulWidget {
  @override
  // ignore: unnecessary_new
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controlleremail = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController controllerfirst_name = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController controllerlast_name = TextEditingController();
  TextEditingController controlleravatar = TextEditingController();

  //TextEditingController controllerNivel = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void addData() {
    var url = "https://backend-consumo.herokuapp.com/users/";

    http.post(Uri.parse(url), body: {
      "email": controlleremail.text,
      "first_name": controllerfirst_name.text,
      "last_name": controllerlast_name.text,
      "avatar": controlleravatar.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AGREGAR USUARIOS"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  ListTile(
                    title: TextFormField(
                      controller: controlleremail,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "LLENE EL CAMPO VACIO";
                        }
                      },
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        labelText:"Correo"
                      ),
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      controller: controllerfirst_name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "LLENE EL CAMPO VACIO";
                        }
                      },
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
              
                        labelText: "First name",
                      ),
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      controller: controllerlast_name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "LLENE EL CAMPO VACIO";
                        }
                      },
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                      
                        labelText: "Last_name",
                      ),
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      controller: controlleravatar,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "LLENE EL CAMPO VACIO";
                        }
                      },
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        labelText: "Url imagen",
                      ),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    // ignore: prefer_const_constructors
                    child: Text("AGREGAR"),
                    color: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addData();
               Navigator.of(context).push( MaterialPageRoute(
                        builder: (BuildContext context) =>  HomePage()));
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
