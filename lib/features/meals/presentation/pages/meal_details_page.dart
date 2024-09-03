// lib/features/meals/presentation/pages/meal_detail_page.dart
import 'package:flutter/material.dart';
import 'package:meal_app/features/meals/domain/entities/meal.dart';

class MealDetailPage extends StatelessWidget {
  final Meal meal;

  const MealDetailPage({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
      ),
      body: SingleChildScrollView(  // Agregar SingleChildScrollView aquí
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(meal.thumbnail),
            SizedBox(height: 16),
            Text(
              meal.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              meal.category,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),
            Text(
              meal.instructions ?? 'No instructions available.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
