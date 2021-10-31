import 'package:api_consumo/home_page.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          //RUTAs CON LA QUE AL TERMINAR DE CARGAR EL SPLASHSCREEN REDIRIGE A LOGIN
          '/': (context) => HomePage(),
          //'/actualizar': (context) => Update(listrespose: listRespose),
        });
  }
}
