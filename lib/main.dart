import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/presentation/screens/home_screen.dart';
import 'package:hotel_app/presentation/screens/splash_screen.dart';
import 'package:hotel_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: kIsWeb ? const HomeScreen() : const SplashScreen(),
    );
  }
}
