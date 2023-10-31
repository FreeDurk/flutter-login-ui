import 'package:flutter/material.dart';

import 'package:my_bud/constants/theme_data.dart';
import 'package:my_bud/route/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: '/',
      onGenerateRoute: GenerateRoute.route,
    );
  }
}
