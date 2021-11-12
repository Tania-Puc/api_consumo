import 'dart:convert';

import 'package:api_consumo/screens/login_screen.dart';
import 'package:api_consumo/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

/*class Editar extends StatefulWidget {
  @override

  
  // ignore: override_on_non_overriding_member
  final int id;

  // ignore: non_constant_identifier_names
  const Editar({Key? key, required this.id}) : super(key: key);
  _EditarState createState() => _EditarState(id: id);
}*/

class Editar extends StatefulWidget {
  // ignore: no_logic_in_create_state
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _EditarState(id: id);
  final int id;
  const Editar({Key? key, required this.id}) : super(key: key);
  // ignore: prefer_const_constructors_in_immutables

}

class _EditarState extends State<Editar> {
  // ignore: non_constant_identifier_names
  final int id;
  // ignore: non_constant_identifier_names
  final email = TextEditingController();
  final pass = TextEditingController();
  final first_name = TextEditingController();
  final last_name = TextEditingController();
  final avatar = TextEditingController();
  // ignore: non_constant_identifier_names, unused_element
  _EditarState({Key? key, required this.id});

  // del TextField!

  @override
  void dispose() {
    // del TextField!
    /*Ya que el TextField no tiene un ID como en Android, el texto no puede ser recuperado sobre demanda, en su lugar debe ser guardado en una variable al ser cambiado o usar un controlador. */
    email.dispose();
    pass.dispose();
    first_name.dispose();
    last_name.dispose();
    avatar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuración del perfil " + id.toString(),
            style: const TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 14.0)),
        //efecto degradado
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              const SizedBox(
                height: double.infinity,
                width: double.infinity,
              ),
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 12.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildfirst_nameTF(),
                      const SizedBox(
                        height: 8.0,
                      ),
                      _buildlast_nameTF(),
                      const SizedBox(
                        height: 8.0,
                      ),
                      _buildemailTF(),
                      const SizedBox(
                        height: 8.0,
                      ),
                      _buildpassTF(),
                      const SizedBox(
                        height: 8.0,
                      ),
                      _buildavatarTF(),
                      const SizedBox(
                        height: 5.0,
                      ),
                      _buildUpdateBtn()
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

  Widget _buildlast_nameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Last name',
          style: kLabelStyle2,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle1,
          height: 60.0,
          child: TextField(
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              hintText: 'Ingrese su Apellido',
              hintStyle: kHintTextStyle2,
            ),
            controller: last_name,
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget _buildfirst_nameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'First name',
          style: kLabelStyle2,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle1,
          height: 60.0,
          child: TextField(
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              hintText: 'Ingrese su Nombre',
              hintStyle: kHintTextStyle2,
            ),
            controller: first_name,
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget _buildemailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: kLabelStyle2,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle1,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email_sharp,
                color: Colors.black,
              ),
              hintText: 'Ingrese su Email',
              hintStyle: kHintTextStyle2,
            ),
            controller: email,
          ),
        ),
      ],
    );
  }

  Widget _buildpassTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Contraseña',
          style: kLabelStyle2,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle1,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.password_sharp,
                color: Colors.black,
              ),
              hintText: 'Ingrese su Contraseña',
              hintStyle: kHintTextStyle2,
            ),
            controller: pass,
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
          'Avatar',
          style: kLabelStyle2,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle1,
          height: 60.0,
          child: TextField(
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.image_sharp,
                color: Colors.black,
              ),
              hintText: 'Ingrese URL de Imagen',
              hintStyle: kHintTextStyle2,
            ),
            controller: avatar,
          ),
        ),
      ],
    );
  }

  Widget _buildUpdateBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      // ignore: deprecated_member_use
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Editar Cuenta'),
              content: const Text('¿Desea Actualizar?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'No'),
                  child: const Text('No'),
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
                            onPressed: () => Navigator.pop(context, 'OK'),

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
                      Future listapost = fetchPost2(context,email.text,pass.text,first_name.text,last_name.text,avatar.text,id);

                    }
                  },
                  child: const Text('Si'),
                ),
              ],
            ),
          );
        },
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: const Color(0xFF527DAA),
        child: const Text(
          'Editar Cuenta',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
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
fetchPost2(
    BuildContext context,
    // ignore: non_constant_identifier_names
    String email,
    String pass,
    // ignore: non_constant_identifier_names
    String first_name,
    String last_name,
    String avatar,
    // ignore: non_constant_identifier_names
    int id) async {
  final response = await http.get(Uri.parse('http://www.consumoapi.somee.com/WebServices.asmx/Modificar?email=$email&pass=$pass&first_name=$first_name&last_name=$last_name&avatar=$avatar&id='+id.toString()));
      print('http://www.consumoapi.somee.com/WebServices.asmx/Modificar?email=$email&pass=$pass&firts_name=$first_name&last_name=$last_name&avatar=$avatar&id='+id.toString());

  if (response.statusCode == 200) {
    int lista = parsePost(response.body);
    print(lista);
    if (lista > 0) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => const LoginScreen()));   
      print('SE EJECUTA LA ACTUALIZACION');

       } else {
      print('NO SE EJECUTA LA ACTUALIZACION');
    }
    return lista;
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}
