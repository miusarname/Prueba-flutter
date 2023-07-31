import 'package:flutter/material.dart';
import 'package:prueba_flutter/Views/Log/Login.dart';
import 'package:prueba_flutter/Views/register/register.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => Index();
}

class Index extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Prueba Flutter',
        home: const Login(),
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        routes: {'/secondScreen': (context) => const SecondScreen()});
  }
}
