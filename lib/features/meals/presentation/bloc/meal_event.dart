// lib/features/meals/presentation/bloc/meal_event.dart
part of 'meal_bloc.dart';

abstract class MealEvent extends Equatable {
  const MealEvent();

  @override
  List<Object?> get props => [];
}

class FetchMealsEvent extends MealEvent {}
