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

import 'package:api_consumo/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: use_key_in_widget_constructors
class AddData extends StatefulWidget {

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controlleremail =  TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController controllerfirst_name =  TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController controllerlast_name =  TextEditingController();
  TextEditingController controlleravatar =  TextEditingController();

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
    return  Scaffold(
      appBar:  AppBar(
        title: const  Text("Agregar Usuarios"),
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
                    leading: const Icon(Icons.email, color: Colors.black),
                    title:  TextFormField(
                      controller: controlleremail,
                      validator: (value) {
                        if (value!.isEmpty) {return "Ingresa un nombre email";}
                      },
                      decoration:  const InputDecoration(
                        hintText: "Email",
                        labelText: "Email",
                      ),
                    ),
                  ),
                   ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title:  TextFormField(
                      controller: controllerfirst_name,
                      validator: (value) {
                        if (value!.isEmpty){ return "Ingresa su primer nombre";}
                      },
                      decoration: const InputDecoration(
                        hintText: "First namae",
                        labelText: "First name",
                      ),
                    ),
                  ),
                   ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title:  TextFormField(
                      controller: controllerlast_name,
                      validator: (value) {
                        if (value!.isEmpty) {return "Ingresa su apallido";}
                      },
                      decoration: const InputDecoration(
                        hintText: "Last name",
                        labelText: "Last_name",
                      ),
                    ),
                  ),
                   ListTile(
                    leading: const Icon(Icons.image, color: Colors.black),
                    title:  TextFormField(
                      controller: controlleravatar,
                      validator: (value) {
                        if (value!.isEmpty){
                          {
                           return "Ingresa la url de una imagen";}

                        }
                         
                      },
                      decoration: const InputDecoration(
                        hintText: "Url imagen",
                        labelText: "Url imagen",
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(30.0),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    child: const Text("Agregar"),
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addData();
                   Navigator.of(context).push(MaterialPageRoute(
                          // ignore: prefer_const_constructors, unnecessary_new
                          builder: (BuildContext context) => new Home()));
                      }
                    },
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    child: const Text("Salir"),
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          // ignore: prefer_const_constructors, unnecessary_new
                          builder: (BuildContext context) => new Home()));
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
