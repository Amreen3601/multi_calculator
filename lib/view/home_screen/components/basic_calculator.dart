import 'package:multi_calculator/constants/utils/exports.dart';

class BasicCalculator extends StatelessWidget {
  const BasicCalculator({Key? key}) : super(key: key);

  Widget _buildButton(BuildContext context, String value, {Color? color}) {
    return ElevatedButton(
      onPressed: () => context.read<HomeProvider>().onButtonPressed(value),
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.grey.shade800,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        value,
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.white),
      ),
    ).paddingAll(8).expanded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: const Text(
          'Basic Calculator',
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
      body: Consumer<HomeProvider>(builder: (context, homeController, child) {
        return Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                homeController.output,
                style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
            ).expanded,
            Column(
              children: [
                Row(children: [
                  _buildButton(context, "7"),
                  _buildButton(context, "8"),
                  _buildButton(context, "9"),
                  _buildButton(context, "÷", color: AppColors.orange)
                ]),
                Row(children: [
                  _buildButton(context, "4"),
                  _buildButton(context, "5"),
                  _buildButton(context, "6"),
                  _buildButton(context, "×", color: AppColors.orange)
                ]),
                Row(children: [
                  _buildButton(context, "1"),
                  _buildButton(context, "2"),
                  _buildButton(context, "3"),
                  _buildButton(context, "-", color: AppColors.orange)
                ]),
                Row(children: [
                  _buildButton(context, "C", color: AppColors.red),
                  _buildButton(context, "0"),
                  _buildButton(context, "=", color: AppColors.green),
                  _buildButton(context, "+", color: AppColors.orange)
                ]),
                Row(children: [
                  _buildButton(context, "√", color: AppColors.primary),
                  _buildButton(context, "%", color: AppColors.secondary),
                ]),
              ],
            ),
          ],
        );
      }),
    );
  }
}
