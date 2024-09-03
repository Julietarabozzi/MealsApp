// lib/features/meals/domain/repositories/meal_repository.dart
import 'package:meal_app/features/meals/domain/entities/meal.dart';

abstract class MealRepository {
  Future<List<Meal>> getMeals();
  Future<Meal> getMealById(String id);
}
