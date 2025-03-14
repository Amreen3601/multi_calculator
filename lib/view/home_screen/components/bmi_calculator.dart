import 'package:multi_calculator/constants/utils/exports.dart';

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: AppColors.teal,
      ),
      body: Consumer<HomeProvider>(
        builder: (context, bmiProvider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: bmiProvider.weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Weight (kg)',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  prefixIcon:
                      const Icon(Icons.monitor_weight, color: AppColors.teal),
                ),
              ),
              20.heightBox,
              TextField(
                controller: bmiProvider.heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Height (cm)',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  prefixIcon: const Icon(Icons.height, color: AppColors.teal),
                ),
              ),
              30.heightBox,
              ElevatedButton(
                onPressed: bmiProvider.calculateBMI,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.teal,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text(
                  'Calculate BMI',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                ),
              ),
              30.heightBox,
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.tealLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      'BMI: ${bmiProvider.bmi.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    10.heightBox,
                    Text(
                      'Category: ${bmiProvider.category}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ).paddingAll(16);
        },
      ),
    );
  }
}
