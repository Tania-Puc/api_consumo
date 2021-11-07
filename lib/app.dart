//import 'package:api_consumo/home_page.dart';
//import 'package:api_consumo/home_page.dart';
import 'package:api_consumo/login_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          //RUTAs CON LA QUE AL TERMINAR DE CARGAR EL SPLASHSCREEN REDIRIGE A LOGIN
          // ignore: prefer_const_constructors, unnecessary_new
          '/': (context) => new LoginPage(),
          '/bodegaPage': (BuildContext context)=> new Home(id: id),

          
          //'/actualizar': (context) => Update(listrespose: listRespose),
        });
  }
}
