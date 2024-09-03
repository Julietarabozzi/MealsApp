// lib/features/meals/presentation/bloc/meal_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_app/core/usecases/usecase.dart';
import 'package:meal_app/features/meals/domain/entities/meal.dart';
import 'package:meal_app/features/meals/domain/usecases/get_meals.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  final GetMeals getMeals;

  MealBloc({required this.getMeals}) : super(MealInitial()) {
    on<FetchMealsEvent>((event, emit) async {
      emit(MealLoading());
      try {
        final meals = await getMeals(NoParams());
        emit(MealLoaded(meals: meals));
      } catch (e) {
        emit(MealError(message: e.toString()));
      }
    });
  }
  
}
