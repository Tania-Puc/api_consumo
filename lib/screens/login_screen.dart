import 'dart:convert';
import 'package:api_consumo/screens/adduser_page.dart';
import 'package:api_consumo/src/datosuser.dart';
import 'package:api_consumo/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final pass = TextEditingController();
  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    email.dispose();
    pass.dispose();
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
          child: TextField(
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
              hintText: 'Igrese su correo',
              hintStyle: kHintTextStyle,
            ),
            controller: email,
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
          child: TextField(
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
              hintText: 'Igrese su contraseña',
              hintStyle: kHintTextStyle,
            ),
            controller: pass,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          primary: Colors.white, // background
        ),
        onPressed: () {
          // ignore: unused_local_variable
          Future<List<Usuario>> listapost =
              fetchPost2(context, email.text, pass.text);
        },
        child: const Text(
          'Iniciar Sesión',
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
        MaterialPageRoute(builder: (BuildContext context) => AddData()),
      ),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: '¿No tienes una cuenta? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Registrar',
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
                    vertical: 90.0,
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
                        'Iniciar Sesión',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      _buildEmailTF(),
                      const SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
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

List<Usuario> parsePost(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Usuario>((json) => Usuario.fromJson(json)).toList();
}

Future<List<Usuario>> fetchPost2(
    BuildContext context, String email, String pass) async {
  final response = await http.get(Uri.parse(
      'http://www.consumoapi.somee.com/WebServices.asmx/Login?email=$email&pass=$pass'));
  // ignore: avoid_print
  print(
      'http://www.consumoapi.somee.com/WebServices.asmx/Login?email=$email&pass=$pass');
  if (response.statusCode == 200) {
    List<Usuario> lista = parsePost(response.body);
    print(lista.length);
    if (lista.isNotEmpty) {
      if (email == "" || pass == "") {
        print('error campos vacios');
      } else {
        print('si se ejecuto');

        Navigator.pushReplacementNamed(context, "/nuevo",
            arguments: datosArguments(
                lista[0].id,
                lista[0].email,
                lista[0].pass,
                lista[0].firts_name,
                lista[0].last_name,
                lista[0].avatar));
      }
    } else {
      print('error');
    }
    return lista;
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}
