import 'dart:async';
import 'dart:convert';
import 'package:api_consumo/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

late  int id;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  Future<List> _login() async {
    var url = "http://192.168.3.107:3000/users/";
    final response = await http.post(Uri.parse(url), body: {
      "email": user.text,
      "pass": pass.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    } else {
      Navigator.of(context).push(MaterialPageRoute(
          // ignore: unnecessary_new
          builder: (BuildContext context) => Home(id:id)));

      setState(() {
        id = datauser[0]['id'];
      });
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Username",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: user,
                decoration: InputDecoration(hintText: 'Username'),
              ),
              Text(
                "Password",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
              ),

              // ignore: deprecated_member_use
              RaisedButton(
                child: Text("Login"),
                onPressed: () {
                  _login();
                },
              ),

              Text(
                msg,
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
