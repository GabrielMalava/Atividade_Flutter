import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Certifique-se de que o caminho está correto

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClassMate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Define HomeScreen como a tela inicial
    );
  }
}
