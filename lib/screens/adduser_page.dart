// ignore: duplicate_ignore
// ignore_for_file: deprecated_member_use, non_constant_identifier_names, duplicate_ignore

import 'dart:convert';
import 'package:api_consumo/screens/login_screen.dart';
import 'package:api_consumo/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  AddData({Key? key}) : super(key: key);
  @override
  _AddDataState createState() => _AddDataState();
}

// ignore: duplicate_ignore, duplicate_ignore
class _AddDataState extends State<AddData> {
  final email = TextEditingController();
  final pass = TextEditingController();
  final first_name = TextEditingController();
  final last_name = TextEditingController();
  final avatar = TextEditingController();

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    email.dispose();
    pass.dispose();
    first_name.dispose();
    last_name.dispose();
    avatar.dispose();
    super.dispose();
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Correo',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Ingrese su correo',
              hintStyle: kHintTextStyle,
            ),
            controller: email,
            validator: (value) {
              if (value!.isEmpty) {
                return "Ingrese su correo";
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Contraseña',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            obscureText: true,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Ingrese su contraseña',
              hintStyle: kHintTextStyle,
            ),
            controller: pass,
            validator: (value) {
              if (value!.isEmpty) {
                return "Ingresa su contraseña";
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildlast_nameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Apellido',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Ingrese su apellido',
              hintStyle: kHintTextStyle,
            ),
            controller: last_name,
          ),
        ),
      ],
    );
  }

  Widget _buildavatarTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Imagen',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.image,
                color: Colors.white,
              ),
              hintText: 'Ingrese URL de imagen',
              hintStyle: kHintTextStyle,
            ),
            controller: avatar,
          ),
        ),
      ],
    );
  }

  Widget _buildfirst_nameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Nombre',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Ingrese su nombre',
              hintStyle: kHintTextStyle,
            ),
            controller: first_name,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Crear Cuenta'),
              content: const Text('¿Desea crear una cuenta?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (email.text == "" ||
                        pass.text == "" ||
                        first_name.text == "" ||
                        last_name.text == "" ||
                        avatar.text == "") {
                                        showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Error'),
                      content: const Text(
                        ' Error, Intentelo nuevamente',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>AddData()));
                          },
                          style: TextButton.styleFrom(
                            primary: const Color(0xFF61A4F1),
                          ),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                    } else {
                      // ignore: unused_local_variable
                      Future listapost = fetchPost2(
                          context,
                          email.text,
                          pass.text,
                          first_name.text,
                          last_name.text,
                          avatar.text);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const LoginScreen()));
                    }
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );

          /*if (email.text == "" ||
              pass.text == "" ||
              first_name.text == "" ||
              last_name.text == "" ||
              avatar.text == "") {
            // ignore: avoid_print
            print('error');
          } else {
            // ignore: unused_local_variable
   
            Future listapost = fetchPost2(context, email.text, pass.text,
                first_name.text, last_name.text, avatar.text);
          }*/
        },
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: const Text(
          'Crear cuenta',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen()),
      ),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: '¿Ya tienes cuenta? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Iniciar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 40.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Security App',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Registrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      _buildEmailTF(),
                      const SizedBox(
                        height: 8.0,
                      ),
                      _buildPasswordTF(),
                      const SizedBox(
                        height: 8.0,
                      ),
                      _buildfirst_nameTF(),
                      const SizedBox(
                        height: 8.0,
                      ),
                      _buildlast_nameTF(),
                      const SizedBox(
                        height: 8.0,
                      ),
                      _buildavatarTF(),
                      _buildLoginBtn(),
                      _buildSignupBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Usuario {
  // ignore: non_constant_identifier_names
  final int id;
  // ignore: non_constant_identifier_names
  final String email;
  final String pass;
  // ignore: non_constant_identifier_names
  final String firts_name;
  // ignore: non_constant_identifier_names
  final String last_name;
  final String avatar;
  // ignore: non_constant_identifier_names
  Usuario(
      {
      // ignore: non_constant_identifier_names
      required this.id,
      required this.email,
      // ignore: non_constant_identifier_names
      required this.pass,
      // ignore: non_constant_identifier_names
      required this.firts_name,
      // ignore: non_constant_identifier_names
      required this.last_name,
      required this.avatar});
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        id: json['id'],
        email: json['email'],
        pass: json['pass'],
        firts_name: json['first_name'],
        last_name: json['last_name'],
        avatar: json['avatar']);
  }
}

int parsePost(String responseBody) {
  //final parsed = json.decode(responseBody).cast<Map<int, dynamic>>();
  //solo devuelve un uno o un cero es de la siguiente manera
  final int parsed = json.decode(responseBody);
  return parsed;
}

// ignore: non_constant_identifier_names
fetchPost2(BuildContext context, String email, String pass, String first_name,String last_name, String avatar) async {
  final response = await http.get(Uri.parse(
      'http://www.consumoapi.somee.com/WebServices.asmx/Guardar?email=$email&pass=$pass&first_name=$first_name&last_name=$last_name&avatar=$avatar'));
  print(
      'http://www.consumoapi.somee.com/WebServices.asmx/Guardar?email=$email&pass=$pass&first_name=$first_name&last_name=$last_name&avatar=$avatar');
  if (response.statusCode == 200) {
    int lista = parsePost(response.body);
    print('se ejecuto 1');
    print(lista);
    if (lista > 0) {
      print('si se ejecuto');
    } else {
      print('error');
    }
    return lista;
  } else {
    print(throw Exception('Unable to fetch products from the REST API'));
  }
}
