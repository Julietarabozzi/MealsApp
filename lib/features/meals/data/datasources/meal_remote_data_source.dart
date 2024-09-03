// lib/features/meals/data/datasources/meal_remote_data_source.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meal_app/features/meals/data/models/meal_model.dart';

abstract class MealRemoteDataSource {
  Future<List<MealModel>> fetchMeals();
  Future<MealModel> fetchMealById(String id);
}

class MealRemoteDataSourceImpl implements MealRemoteDataSource {
  final http.Client client;

  MealRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MealModel>> fetchMeals() async {
    final response = await client.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s='));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final meals = data['meals'] as List;
      return meals.map((meal) => MealModel.fromJson(meal)).toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }

  @override
  Future<MealModel> fetchMealById(String id) async {
    final response = await client.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final meal = data['meals'][0];
      return MealModel.fromJson(meal);
    } else {
      throw Exception('Failed to load meal');
    }
  }
}
