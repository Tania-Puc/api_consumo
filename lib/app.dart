import 'package:api_consumo/add_page.dart';
import 'package:api_consumo/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          //RUTAs CON LA QUE AL TERMINAR DE CARGAR EL SPLASHSCREEN REDIRIGE A LOGIN
          '/': (context) => Home(),
          //'/actualizar': (context) => Update(listrespose: listRespose),
        });
  }
}
