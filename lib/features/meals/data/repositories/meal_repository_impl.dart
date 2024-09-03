// lib/features/meals/data/repositories/meal_repository_impl.dart
import 'package:meal_app/features/meals/data/datasources/meal_remote_data_source.dart';
import 'package:meal_app/features/meals/domain/entities/meal.dart';
import 'package:meal_app/features/meals/domain/repositories/meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  final MealRemoteDataSource remoteDataSource;

  MealRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Meal>> getMeals() async {
    return await remoteDataSource.fetchMeals();
  }

  @override
  Future<Meal> getMealById(String id) async {
    return await remoteDataSource.fetchMealById(id);
  }
}
