import 'package:flutter/material.dart';
import 'package:multi_calculator/screens/home_screen.dart';

void main() {
  runApp(const MultiCalculatorApp());
}

class MultiCalculatorApp extends StatelessWidget {
  const MultiCalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi Calculator',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
