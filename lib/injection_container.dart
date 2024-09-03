// lib/injection_container.dart
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:meal_app/features/meals/data/datasources/meal_remote_data_source.dart';
import 'package:meal_app/features/meals/data/repositories/meal_repository_impl.dart';
import 'package:meal_app/features/meals/domain/repositories/meal_repository.dart';
import 'package:meal_app/features/meals/domain/usecases/get_meals.dart';
import 'package:meal_app/features/meals/presentation/bloc/meal_bloc.dart';

final sl = GetIt.instance;

void init() {
  // Features - Meals
  sl.registerFactory(() => MealBloc(getMeals: sl()));
  
  // Use cases
  sl.registerLazySingleton(() => GetMeals(sl()));
  
  // Repository
  sl.registerLazySingleton<MealRepository>(() => MealRepositoryImpl(remoteDataSource: sl()));
  
  // Data sources
  sl.registerLazySingleton<MealRemoteDataSource>(() => MealRemoteDataSourceImpl(client: sl()));
  
  // External
  sl.registerLazySingleton(() => http.Client());
}
