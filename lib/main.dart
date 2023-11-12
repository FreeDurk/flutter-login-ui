import 'package:flutter/material.dart';

import 'package:my_bud/constants/theme_data.dart';
import 'package:my_bud/firebase_options.dart';
import 'package:my_bud/route/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
