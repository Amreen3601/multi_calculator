import 'package:flutter/material.dart';
import 'dart:math';

class BasicCalculator extends StatefulWidget {
  const BasicCalculator({Key? key}) : super(key: key);

  @override
  _BasicCalculatorState createState() => _BasicCalculatorState();
}

class _BasicCalculatorState extends State<BasicCalculator> {
  String _output = "0";
  String _currentInput = "";
  String _operation = "";
  double _num1 = 0;
  double _num2 = 0;

  void _onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        _output = "0";
        _currentInput = "";
        _operation = "";
        _num1 = 0;
        _num2 = 0;
      } else if (value == "=") {
        _num2 = double.tryParse(_currentInput) ?? 0;
        switch (_operation) {
          case "+":
            _output = (_num1 + _num2).toString();
            break;
          case "-":
            _output = (_num1 - _num2).toString();
            break;
          case "×":
            _output = (_num1 * _num2).toString();
            break;
          case "÷":
            _output = _num2 != 0 ? (_num1 / _num2).toString() : "Error";
            break;
          case "%":
            _output = ((_num1 * _num2) / 100).toString();
            break;
        }
        _currentInput = _output;
        _operation = "";
      } else if (["+", "-", "×", "÷", "%"].contains(value)) {
        if (_currentInput.isNotEmpty) {
          _num1 = double.tryParse(_currentInput) ?? 0;
          _operation = value;
          _output = "$_num1 $_operation ";
          _currentInput = "";
        }
      } else if (value == "√") {
        _num1 = double.tryParse(_currentInput) ?? 0;
        _output = (_num1 >= 0) ? sqrt(_num1).toString() : "Error";
        _currentInput = _output;
        _operation = "";
      } else {
        _currentInput += value;
        _output = _operation.isEmpty
            ? _currentInput
            : "$_num1 $_operation $_currentInput";
      }
    });
  }

  Widget _buildButton(String value, {Color? color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(value),
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey.shade800,
            padding: const EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Text(
            value,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Basic Calculator',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                _output,
                style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Column(
            children: [
              Row(children: [
                _buildButton("7"),
                _buildButton("8"),
                _buildButton("9"),
                _buildButton("÷", color: Colors.orange)
              ]),
              Row(children: [
                _buildButton("4"),
                _buildButton("5"),
                _buildButton("6"),
                _buildButton("×", color: Colors.orange)
              ]),
              Row(children: [
                _buildButton("1"),
                _buildButton("2"),
                _buildButton("3"),
                _buildButton("-", color: Colors.orange)
              ]),
              Row(children: [
                _buildButton("C", color: Colors.red),
                _buildButton("0"),
                _buildButton("=", color: Colors.green),
                _buildButton("+", color: Colors.orange)
              ]),
              Row(children: [
                _buildButton("√", color: Colors.blue),
                _buildButton("%", color: Colors.purple),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
