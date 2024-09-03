// lib/features/meals/domain/entities/meal.dart
import 'package:equatable/equatable.dart';

class Meal extends Equatable {
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String thumbnail;

  const Meal({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.thumbnail,
  });

  @override
  List<Object?> get props => [id, name, category, area, instructions, thumbnail];
}
