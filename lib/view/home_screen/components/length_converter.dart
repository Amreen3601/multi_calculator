import 'package:multi_calculator/constants/utils/exports.dart';

class LengthConverter extends StatelessWidget {
  const LengthConverter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: 'Length Converter'
            .toText(fontSize: 20, fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: homeProvider.inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Value',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: Icons.swap_horiz.toIcon(color: AppColors.primary),
              ),
              onChanged: (value) => homeProvider.convert(),
            ),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: homeProvider.fromUnit,
                    items: homeProvider.conversionRates.keys.map((String unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: unit.toText(color: AppColors.black),
                      );
                    }).toList(),
                    onChanged: (value) => homeProvider.setFromUnit(value!),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                10.widthBox,
                Icons.arrow_forward.toIcon(color: AppColors.primary),
                10.widthBox,
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: homeProvider.toUnit,
                    items: homeProvider.conversionRates.keys.map((String unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: unit.toText(color: AppColors.black),
                      );
                    }).toList(),
                    onChanged: (value) => homeProvider.setToUnit(value!),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
            30.heightBox,
            ('Converted Value: ${homeProvider.convertedValue} ${homeProvider.toUnit}')
                .toText(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black)
                .toContainer(
                    color: AppColors.primary.withOpacity(0.1), borderRadius: 12)
                .centered(),
          ],
        ),
      ),
    );
  }
}
