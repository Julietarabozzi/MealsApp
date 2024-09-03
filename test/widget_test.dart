import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_app/features/meals/domain/entities/meal.dart';
import 'package:meal_app/features/meals/presentation/pages/meals_page.dart';
import 'package:meal_app/features/meals/presentation/bloc/meal_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MockMealBloc extends Mock implements MealBloc {}

void main() {
  testWidgets('MealsPage displays a list of meals when MealLoaded state is emitted', (WidgetTester tester) async {
    // Arrange
    final mockMealBloc = MockMealBloc();
    when(mockMealBloc.state).thenReturn(const MealLoaded(meals: [
      const Meal(id: '1', name: 'Meal 1', category: 'Category 1', thumbnail: 'http://example.com/1.jpg', area: '', instructions: ''),
      Meal(id: '2', name: 'Meal 2', category: 'Category 2', thumbnail: 'http://example.com/2.jpg', area: '', instructions: ''),
    ]));

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<MealBloc>(
          create: (_) => mockMealBloc,
          child: const MealsPage(),
        ),
      ),
    );

    // Assert
    expect(find.text('Meal 1'), findsOneWidget);
    expect(find.text('Meal 2'), findsOneWidget);
  });

  testWidgets('MealsPage shows loading indicator when MealLoading state is emitted', (WidgetTester tester) async {
    // Arrange
    final mockMealBloc = MockMealBloc();
    when(mockMealBloc.state).thenReturn(MealLoading());

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<MealBloc>(
          create: (_) => mockMealBloc,
          child: const MealsPage(),
        ),
      ),
    );

    // Assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
