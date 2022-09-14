import 'package:flutter/material.dart';
import 'package:tugas1_mobile/informasi.dart';
import 'package:tugas1_mobile/kalkulator.dart';
import 'package:tugas1_mobile/login.dart';
import 'package:tugas1_mobile/register.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  final routes = <String, WidgetBuilder>{
    login.tag: (context) => login(),
    informasi.tag: (context) => informasi(),
    kalkulator.tag: (context) => kalkulator(),
    register.tag: (context) => register(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: login(),
      routes:routes,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

