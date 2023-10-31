import 'package:flutter/material.dart';
import 'package:my_bud/app/authentication/pages/login.dart';
import 'package:my_bud/app/authentication/pages/register.dart';

class GenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (context) => const Register());
      case '/dashboard':
      // return MaterialPageRoute(builder: (context) => const Dashboard());

      default:
        return routeError();
    }
  }

  static Route<dynamic> routeError() {
    return MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text("Something went wrong."),
          ),
        );
      },
    );
  }
}
