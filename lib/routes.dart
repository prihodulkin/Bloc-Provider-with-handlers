import 'package:flutter/material.dart';
import 'package:test_proj/UI/pages/second_page.dart';
import 'UI/pages/first_page.dart';

class Routes {
  static const String firstPage = '/';
  static const String secondPage = '/secondPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case firstPage:
        return MaterialPageRoute(
          builder: (_) =>
              FirstPage(),
        );
      case secondPage:
        return MaterialPageRoute(
          builder: (_) => const SecondPage(),
        );
      default:
        throw FormatException("Route not found");
    }
  }
}
