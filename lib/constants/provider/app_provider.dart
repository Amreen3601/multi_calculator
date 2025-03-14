import 'package:multi_calculator/constants/utils/exports.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => HomeProvider()),
  ];
}
