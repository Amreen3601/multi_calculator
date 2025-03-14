

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_calculator/constants/utils/color.dart';
import 'package:multi_calculator/constants/utils/exports.dart';
import 'package:provider/provider.dart';
import 'package:multi_calculator/constants/utils/extensions.dart';

class AgeCalculator extends StatelessWidget {
  const AgeCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: 'Age Calculator'
              .toText(fontSize: 22, fontWeight: FontWeight.bold),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.transparent,
        ),
        body: Consumer<HomeProvider>(
          builder: (context, controller, child) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade800, Colors.blue.shade300],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        'Select Your Birth Date'
                            .toText(fontSize: 18, fontWeight: FontWeight.bold),
                        const SizedBox(height: 10),
                        (controller.selectedDate == null
                                ? 'Choose Date'
                                : DateFormat('dd MMM, yyyy')
                                    .format(controller.selectedDate!))
                            .toButton(
                                onTap: () => controller.pickDate(context)),
                      ],
                    ).toContainer(),
                    const SizedBox(height: 30),
                    AnimatedOpacity(
                      opacity: controller.ageResult.isEmpty ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 500),
                      child: AgeResultCard(controller.ageResult),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AgeResultCard extends StatelessWidget {
  final String result;
  const AgeResultCard(this.result, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        'Your Age'.toText(fontSize: 18, fontWeight: FontWeight.bold),
        const SizedBox(height: 10),
        result.toText(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.yellow),
      ],
    ).toContainer();
  }
}
