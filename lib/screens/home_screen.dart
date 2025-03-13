import 'package:flutter/material.dart';
import 'package:multi_calculator/screens/age_calculator.dart';
import 'package:multi_calculator/screens/basic_calculator.dart';
import 'package:multi_calculator/screens/bmi_calculator.dart';
import 'package:multi_calculator/screens/currency_converter.dart';
import 'package:multi_calculator/screens/length_converter.dart';
import 'package:multi_calculator/screens/temperature_converter.dart';
import 'package:multi_calculator/screens/weight_converter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> features = [
      {
        'title': 'Age Calculator',
        'icon': Icons.calendar_today,
        'screen': const AgeCalculator(),
        'color': Colors.purple
      },
      {
        'title': 'Temp Converter',
        'icon': Icons.thermostat,
        'screen': const TemperatureConverter(),
        'color': Colors.orange
      },
      {
        'title': 'Weight Converter',
        'icon': Icons.monitor_weight,
        'screen': const WeightConverter(),
        'color': Colors.green
      },
      {
        'title': 'Length Converter',
        'icon': Icons.straighten,
        'screen': const LengthConverter(),
        'color': Colors.blue
      },
      {
        'title': 'BMI Calculator',
        'icon': Icons.fitness_center,
        'screen': const BMICalculator(),
        'color': Colors.red
      },
      {
        'title': 'Basic Calculator',
        'icon': Icons.calculate,
        'screen': const BasicCalculator(),
        'color': Colors.teal
      },
      {
        'title': 'Currency Converter',
        'icon': Icons.monetization_on,
        'screen': const CurrencyConverter(),
        'color': Colors.amber
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Multi Calculator',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade800, Colors.blue.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: features.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => features[index]['screen']),
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: const Offset(4, 4),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [features[index]['color'], Colors.white],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Icon(features[index]['icon'],
                            size: 40, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        features[index]['title'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
