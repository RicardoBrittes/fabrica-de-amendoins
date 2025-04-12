import 'package:flutter/material.dart';
import 'login_screen.dart'; // Importa a tela de login

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fábrica de Amendoins',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        useMaterial3: true,
      ),
      home: const LoginScreen(), // Define a tela inicial
      debugShowCheckedModeBanner: false,
    );
  }
}
