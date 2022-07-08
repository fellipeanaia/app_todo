import 'package:app_todo/primeira_pagina.dart';
import 'package:app_todo/segunda_pagina.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const PrimeiraPagina(),
        '/segunda': (context) => SegundaPagina(
              mensage: ModalRoute.of(context)!.settings.arguments as String,
            ),
      },
    );
  }
}
