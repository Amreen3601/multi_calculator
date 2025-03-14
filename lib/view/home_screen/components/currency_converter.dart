import 'package:multi_calculator/constants/utils/exports.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({Key? key}) : super(key: key);

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: const Text(
          "Currency Converter",
          style: TextStyle(color: AppColors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, homeController, child) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                ),
                padding: const EdgeInsets.all(12),
                child: TextField(
                  controller: homeController.amountController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  decoration: const InputDecoration(
                    labelText: "Enter amount in PKR",
                    labelStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                  ),
                ),
              ),
              20.heightBox,
              ElevatedButton(
                onPressed: () {
                  double amount =
                      double.tryParse(homeController.amountController.text) ??
                          0.0;
                  homeController.convertCurrency(amount);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                ),
                child: const Text("Convert",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              20.heightBox,
              Text(
                "Converted Amount: \$${homeController.convertedAmount.toStringAsFixed(2)}",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
              20.heightBox,
              ElevatedButton(
                onPressed: () => homeController.updateExchangeRate(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                ),
                child: const Text("Update Exchange Rate",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ],
          ).paddingAll(16);
        },
      ),
    );
  }
}
