import 'package:multi_calculator/constants/utils/exports.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade900, Colors.blue.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white.withOpacity(0.95),
          shadowColor: Colors.black.withOpacity(0.3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade700, Colors.blue.shade300],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child:
                    const Icon(Icons.calculate, size: 50, color: Colors.white),
              ),
              15.heightBox,
              const Text(
                'Multi Calculator',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              10.heightBox,
              const Text(
                'Multi Calculator is your all-in-one solution for calculations and conversions. Whether you need to calculate your BMI, convert currency, or check your age, we have got you covered!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              15.heightBox,
              const Divider(thickness: 1, color: Colors.grey),
              10.heightBox,
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Features:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              10.heightBox,
              _buildFeatureRow(Icons.calendar_today, "Age Calculator"),
              _buildFeatureRow(Icons.thermostat, "Temperature Converter"),
              _buildFeatureRow(Icons.monitor_weight, "Weight Converter"),
              _buildFeatureRow(Icons.straighten, "Length Converter"),
              _buildFeatureRow(Icons.fitness_center, "BMI Calculator"),
              _buildFeatureRow(Icons.calculate, "Basic Calculator"),
              _buildFeatureRow(Icons.monetization_on, "Currency Converter"),
              20.heightBox,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  backgroundColor: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Back to Home",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ).paddingAll(20),
        ).paddingAll(16).centered(),
      ),
    );
  }

  Widget _buildFeatureRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue.shade700),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    ).paddingSymmetric(vertical: 5);
  }
}
