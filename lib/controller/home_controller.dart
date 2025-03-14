import 'package:multi_calculator/constants/utils/exports.dart';

class HomeProvider extends ChangeNotifier {
  // ======================== Controllers ======================== //

  TextEditingController kgController = TextEditingController();
  TextEditingController gController = TextEditingController();
  TextEditingController mgController = TextEditingController();
  TextEditingController celsiusController = TextEditingController();
  TextEditingController fahrenheitController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  // ======================== Features List ======================== //

  final List<Map<String, dynamic>> features = [
    {
      'title': 'Age Calculator',
      'icon': Icons.calendar_today,
      'screen': const AgeCalculator(),
      'color': AppColors.purple,
    },
    {
      'title': 'Temp Converter',
      'icon': Icons.thermostat,
      'screen': const TemperatureConverter(),
      'color': AppColors.orange,
    },
    {
      'title': 'Weight Converter',
      'icon': Icons.monitor_weight,
      'screen': const WeightConverter(),
      'color': AppColors.green,
    },
    {
      'title': 'Length Converter',
      'icon': Icons.straighten,
      'screen': const LengthConverter(),
      'color': AppColors.primary,
    },
    {
      'title': 'BMI Calculator',
      'icon': Icons.fitness_center,
      'screen': const BMICalculator(),
      'color': AppColors.red,
    },
    {
      'title': 'Basic Calculator',
      'icon': Icons.calculate,
      'screen': const BasicCalculator(),
      'color': AppColors.teal,
    },
    {
      'title': 'Currency Converter',
      'icon': Icons.monetization_on,
      'screen': const CurrencyConverter(),
      'color': AppColors.amber,
    },
  ];

  // ======================== Navigation Function ======================== //
  void navigateToFeature(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  // ======================== Age Calculator ======================== //
  DateTime? selectedDate;
  String ageResult = '';

  void pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      selectedDate = pickedDate;
      _calculateAge();
      notifyListeners();
    }
  }

  void _calculateAge() {
    if (selectedDate == null) return;
    final today = DateTime.now();
    int years = today.year - selectedDate!.year;
    int months = today.month - selectedDate!.month;
    int days = today.day - selectedDate!.day;

    if (days < 0) {
      months--;
      days += DateTime(today.year, today.month, 0).day;
    }
    if (months < 0) {
      years--;
      months += 12;
    }

    ageResult = '$years Years, $months Months, $days Days';
  }

  // ======================== Temperature Converter ======================== //
  void convertCelsiusToFahrenheit(String value) {
    if (value.isEmpty) {
      fahrenheitController.clear();
      return;
    }
    final double? celsius = double.tryParse(value);
    if (celsius != null) {
      final double fahrenheit = (celsius * 9 / 5) + 32;
      fahrenheitController.text = fahrenheit.toStringAsFixed(2);
      notifyListeners();
    }
  }

  void convertFahrenheitToCelsius(String value) {
    if (value.isEmpty) {
      celsiusController.clear();
      return;
    }
    final double? fahrenheit = double.tryParse(value);
    if (fahrenheit != null) {
      final double celsius = (fahrenheit - 32) * 5 / 9;
      celsiusController.text = celsius.toStringAsFixed(2);
      notifyListeners();
    }
  }

  // ======================== Weight Converter ======================== //
  void convertKg(String value) {
    if (value.isEmpty) {
      gController.clear();
      mgController.clear();
      return;
    }
    final double? kg = double.tryParse(value);
    if (kg != null) {
      gController.text = (kg * 1000).toStringAsFixed(2);
      mgController.text = (kg * 1000000).toStringAsFixed(2);
      notifyListeners();
    }
  }

//================================== Length Converter ==================================//
  TextEditingController inputController = TextEditingController();

  String _fromUnit = 'Kilometers';
  String _toUnit = 'Meters';
  double _convertedValue = 0.0;

  final Map<String, double> conversionRates = {
    'Kilometers': 1000.0,
    'Meters': 1.0,
    'Centimeters': 0.01,
    'Millimeters': 0.001,
    'Miles': 1609.34,
    'Yards': 0.9144,
    'Feet': 0.3048,
    'Inches': 0.0254,
  };

  String get fromUnit => _fromUnit;
  String get toUnit => _toUnit;
  double get convertedValue => _convertedValue;

  void setFromUnit(String value) {
    _fromUnit = value;
    convert();
    notifyListeners();
  }

  void setToUnit(String value) {
    _toUnit = value;
    convert();
    notifyListeners();
  }

  void convert() {
    double? inputValue = double.tryParse(inputController.text);
    if (inputValue != null) {
      double baseValue = inputValue * (conversionRates[_fromUnit] ?? 1);
      _convertedValue = baseValue / (conversionRates[_toUnit] ?? 1);
      notifyListeners();
    }
  }

  //========================== BMI Calculate ===============================//

  double _bmi = 0.0;
  String _category = '';

  double get bmi => _bmi;
  String get category => _category;

  void calculateBMI() {
    double? weight = double.tryParse(weightController.text);
    double? height = double.tryParse(heightController.text);

    if (weight != null && height != null && height > 0) {
      double heightInMeters = height / 100;
      _bmi = weight / (heightInMeters * heightInMeters);
      _category = _bmiCategory(_bmi);
      notifyListeners();
    }
  }

  String _bmiCategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 24.9) {
      return 'Normal';
    } else if (bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  //========================= Basic Calculator ==========================//

  String _output = "0";
  String _currentInput = "";
  String _operation = "";
  double _num1 = 0;
  double _num2 = 0;

  String get output => _output;

  void onButtonPressed(String value) {
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
    notifyListeners();
  }

  //========================== Currency Converter ===============================//

  double _exchangeRate = 275.0;
  double _convertedAmount = 0.0;

  double get exchangeRate => _exchangeRate;
  double get convertedAmount => _convertedAmount;

  HomeProvider() {
    _loadExchangeRate();
  }

  Future<void> _loadExchangeRate() async {
    final prefs = await SharedPreferences.getInstance();
    _exchangeRate = prefs.getDouble('exchange_rate') ?? 275.0;
    notifyListeners();
  }

  Future<void> _saveExchangeRate(double rate) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('exchange_rate', rate);
    _exchangeRate = rate;
    notifyListeners();
  }

  void convertCurrency(double amount) {
    _convertedAmount = amount / _exchangeRate;
    notifyListeners();
  }

  void updateExchangeRate(BuildContext context) {
    TextEditingController rateController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
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

  // ======================== Dispose Controllers ======================== //
  @override
  void dispose() {
    kgController.dispose();
    gController.dispose();
    mgController.dispose();
    celsiusController.dispose();
    fahrenheitController.dispose();
    super.dispose();
  }
}
