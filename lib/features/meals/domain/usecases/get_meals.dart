// lib/features/meals/domain/usecases/get_meals.dart
import 'package:meal_app/core/usecases/usecase.dart';
import 'package:meal_app/features/meals/domain/entities/meal.dart';
import 'package:meal_app/features/meals/domain/repositories/meal_repository.dart';

class GetMeals implements UseCase<List<Meal>, NoParams> {
  final MealRepository repository;

  GetMeals(this.repository);

  @override
  Future<List<Meal>> call(NoParams params) async {
    return await repository.getMeals();
  }
}
