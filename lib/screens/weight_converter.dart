import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeightConverter extends StatefulWidget {
  const WeightConverter({Key? key}) : super(key: key);

  @override
  _WeightConverterState createState() => _WeightConverterState();
}

class _WeightConverterState extends State<WeightConverter> {
  final TextEditingController _kgController = TextEditingController();
  final TextEditingController _gController = TextEditingController();
  final TextEditingController _mgController = TextEditingController();

  void _convertKg(String value) {
    if (value.isEmpty) {
      _gController.clear();
      _mgController.clear();
      return;
    }
    final double? kg = double.tryParse(value);
    if (kg != null) {
      setState(() {
        _gController.text = (kg * 1000).toStringAsFixed(2);
        _mgController.text = (kg * 1000000).toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Weight Converter',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade700, Colors.purple.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildInputField('Kilograms', _kgController, Icons.scale,
                    onChanged: _convertKg),
                const SizedBox(height: 20),
                _buildResultField('Grams', _gController, Icons.balance),
                const SizedBox(height: 20),
                _buildResultField(
                    'Milligrams', _mgController, Icons.line_weight),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
      String label, TextEditingController controller, IconData icon,
      {Function(String)? onChanged}) {
    return Container(
      decoration: _boxDecoration(),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.white70),
          labelStyle: const TextStyle(color: Colors.white70),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
        style: const TextStyle(color: Colors.white, fontSize: 18),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildResultField(
      String label, TextEditingController controller, IconData icon) {
    return Container(
      decoration: _boxDecoration(),
      child: TextField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.white70),
          labelStyle: const TextStyle(color: Colors.white70),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          spreadRadius: 2,
          offset: const Offset(4, 4),
        ),
      ],
      border: Border.all(
        color: Colors.white.withOpacity(0.5),
        width: 1.5,
      ),
    );
  }
}
