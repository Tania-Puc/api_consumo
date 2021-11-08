
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home_page.dart';

// ignore: use_key_in_widget_constructors
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
        title: const Text("Registrarse"),
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
              
                        labelText: "Nombre",
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
                      
                        labelText: "Apellido",
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
                        labelText: "Url foto",
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
                    child: Text("Registrarme"),
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
