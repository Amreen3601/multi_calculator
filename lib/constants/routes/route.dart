import 'package:multi_calculator/constants/utils/exports.dart';

class ScreenRoutes {
  static const String splash = "splash";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
