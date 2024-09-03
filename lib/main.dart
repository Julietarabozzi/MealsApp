// lib/main.dart
import 'package:flutter/material.dart';
import 'package:meal_app/injection_container.dart' as di;
import 'package:meal_app/features/meals/presentation/pages/meals_page.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meal App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MealsPage());
  }
}
