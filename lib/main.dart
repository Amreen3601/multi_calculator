import 'package:multi_calculator/constants/utils/exports.dart';

void main() {
  runApp(const MultiCalculatorApp());
}

class MultiCalculatorApp extends StatelessWidget {
  const MultiCalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: ScreenRoutes.splash,
        onGenerateRoute: ScreenRoutes.generateRoute,
        title: 'Multi Calculator',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
