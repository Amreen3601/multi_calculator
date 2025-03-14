import 'package:multi_calculator/constants/utils/exports.dart';

class TemperatureConverter extends StatelessWidget {
  const TemperatureConverter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: 'Temperature Converter'
              .toText(fontSize: 22, fontWeight: FontWeight.bold),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange.shade700, Colors.pink.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Consumer<HomeProvider>(
            builder: (context, provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      'Enter Temperature'
                          .toText(fontSize: 18, fontWeight: FontWeight.bold),
                      const SizedBox(height: 15),
                      _buildTextField(provider.celsiusController, 'Celsius',
                          '°C', provider.convertCelsiusToFahrenheit),
                      const SizedBox(height: 15),
                      _buildTextField(
                          provider.fahrenheitController,
                          'Fahrenheit',
                          '°F',
                          provider.convertFahrenheitToCelsius),
                    ],
                  ).toContainer(),
                ],
              ).centered();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      String unit, Function(String) onChanged) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: AppColors.white, fontSize: 18),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.white.withOpacity(0.8)),
        suffixText: unit,
        suffixStyle: const TextStyle(color: AppColors.white, fontSize: 16),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.white.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.white, width: 2),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
