
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home_page.dart';

class EditData extends StatefulWidget {
  final List? list;
  final int index;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
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
