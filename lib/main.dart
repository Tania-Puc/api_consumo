import 'package:api_consumo/screens/home_screen.dart';
import 'package:api_consumo/screens/login_screen.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Security App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
            routes: {
        //RUTAs CON LA QUE AL TERMINAR DE CARGAR EL SPLASHSCREEN REDIRIGE A LOGIN
        // ignore: prefer_const_constructors
        '/': (context) => LoginScreen(),
        '/nuevo': (context)=>Home(),
      },
      
    );
  }
}
