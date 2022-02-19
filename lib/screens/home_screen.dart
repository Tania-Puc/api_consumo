// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'package:api_consumo/screens/edituser_page.dart';
import 'package:api_consumo/screens/login_screen.dart';
import 'package:api_consumo/src/datosuser.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
  final List? list;
  // ignore: prefer_const_constructors_in_immutables
  Home({Key? key, this.list}) : super(key: key);
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //Trae los valores del usuario
    datosArguments? args =
        ModalRoute.of(context)!.settings.arguments as datosArguments?;
    int id = args!.id;

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(   
              //Imagen se ajusta al condenedor circular            
              currentAccountPicture:   CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 60,
                  child:  ClipOval(
                    child: Image.network(args.avatar,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,),
                    ),
                    ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                ]),
              ),
              accountName: Text(args.first_name.toString(),
                  style: const TextStyle(
                      fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
              accountEmail: Text(args.email.toString(),
                  style: const TextStyle(
                      fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
            ),
            ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFF73AEF5),
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                title: const Text("Configurar Perfil",
                    style: TextStyle(
                        fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
                onTap: () {
                   Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new Editar(id: args.id,)));
                }),
            const Divider(),
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFF61A4F1),
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              title: Text("Ver Mapa",
                  style: TextStyle(
                   fontFamily: 'OpenSans', fontWeight: FontWeight.bold)
                      ),
                      
            ),
            const Divider(),
            ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFF73AEF5),
                  child: Icon(
                    Icons.exit_to_app_sharp,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                title: const Text("Cerrar Sesion",
                    style: TextStyle(
                        fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Cerrar Sesión'),
                      content: Text(
                        args.first_name + ' ¿Esta Seguro que desea Salir?',
                        style: const TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const LoginScreen()));
                          },
                          style: TextButton.styleFrom(
                            primary: const Color(0xFF61A4F1),
                          ),
                          child: const Text('Si'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: TextButton.styleFrom(
                            primary: const Color(0xFF61A4F1),
                          ),
                          child: const Text('No'),
                        ),
                      ],
                    ),
                  );
                }),
            const Divider(),
            ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFF73AEF5),
                  child: Icon(
                    Icons.delete_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                title: const Text("Eliminar Cuenta",
                    style: TextStyle(
                        fontFamily: 'OpenSans', fontWeight: FontWeight.bold)),
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Eliminar Cuenta'),
                      content: Text(
                        "Esta Seguro de Eliminar Su Cuenta " + args.first_name,
                        style: const TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            //Manda el valor del id a fetchpost3 donde esta la consulta del webservice
                            // ignore: unused_local_variable
                            Future listapost = fetchPost3(context, id);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const LoginScreen()));
                          },
                          style: TextButton.styleFrom(
                            primary: const Color(0xFF61A4F1),
                          ),
                          child: const Text('Si'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'No'),
                          child: const Text(
                            'No',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold),
                          ),
                          style: TextButton.styleFrom(
                            primary: const Color(0xFF61A4F1),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              const Divider(),

          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Bienvenido Usuario: " + args.first_name.toString(),
          style: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 16.0,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.justify,
        ),
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
      body: Form(
        child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          Column(
            children: <Widget>[
               CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 90,
                  child:  ClipOval(
                    child: Image.network(args.avatar,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,),
                    ),
                    ),
                                  const Divider(),
              const Text(
                "Nombre:",
                style: TextStyle(
                    fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.person, 
                color: Color(0xFF478DE0)
                 ),
                title: Text(args.first_name.toString()+' '+args.last_name,
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                    ),
                    textAlign: TextAlign.justify),
              ),
              const Divider(),
              const Text(
                "Correo :",
                style: TextStyle(
                    fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Divider(),
              ListTile(
                  leading: const Icon(Icons.person, color: Color(0xFF478DE0)),
                  title: Text(args.email,
                      style: const TextStyle(fontFamily: 'OpenSans'),
                      textAlign: TextAlign.justify)),
              const Divider(),
              const Text(
                "Contraseña:",
                style: TextStyle(
                    fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.person, color: Color(0xFF478DE0)),
                title: Text(
                  args.pass,
                  style: const TextStyle(fontFamily: 'OpenSans'),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ],
      )),
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

fetchPost3(
    // ignore: non_constant_identifier_names
    BuildContext context,
    int id) async {
  final response = await http.get(Uri.parse(
      'http://www.consumoapi.somee.com/WebServices.asmx/Eliminar?id=' +
          id.toString()));
  print('http://www.consumoapi.somee.com/WebServices.asmx/Eliminar?id=' +
      id.toString());
  if (response.statusCode == 200) {
    int lista = parsePost(response.body);
    print(lista);
    if (lista > 0) {
      print('funciona');
      Navigator.pushNamed(context, '/');
    } else {

      print('no funciono');
    }
  }
}
