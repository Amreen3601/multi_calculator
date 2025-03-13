import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({Key? key}) : super(key: key);

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController _amountController = TextEditingController();
  double _exchangeRate = 275.0;
  double _convertedAmount = 0.0;

  @override
  void initState() {
    super.initState();
    _loadExchangeRate();
  }

  Future<void> _loadExchangeRate() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _exchangeRate = prefs.getDouble('exchange_rate') ?? 275.0;
    });
  }

  Future<void> _saveExchangeRate(double rate) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('exchange_rate', rate);
  }

  void _convertCurrency() {
    double amount = double.tryParse(_amountController.text) ?? 0.0;
    setState(() {
      _convertedAmount = amount / _exchangeRate; // PKR to USD conversion
    });
  }

  void _updateExchangeRate() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController rateController = TextEditingController();
        return AlertDialog(
          title: const Text("Update Exchange Rate"),
          content: TextField(
            controller: rateController,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(labelText: "Enter new exchange rate"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                double newRate =
                    double.tryParse(rateController.text) ?? _exchangeRate;
                setState(() {
                  _exchangeRate = newRate;
                });
                _saveExchangeRate(newRate);
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Currency Converter",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                decoration: const InputDecoration(
                  labelText: "Enter amount in PKR",
                  labelStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertCurrency,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
              ),
              child: const Text("Convert",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            Text(
              "Converted Amount: \$${_convertedAmount.toStringAsFixed(2)}",
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateExchangeRate,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
              ),
              child: const Text("Update Exchange Rate",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
