import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:meal_app/core/usecases/usecase.dart';
import 'package:meal_app/features/meals/presentation/bloc/meal_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:meal_app/features/meals/domain/usecases/get_meals.dart';
import 'package:meal_app/features/meals/domain/entities/meal.dart';

class MockGetMeals extends Mock implements GetMeals {}

void main() {
  late MealBloc mealBloc;
  late MockGetMeals mockGetMeals;

  setUp(() {
    mockGetMeals = MockGetMeals();
    mealBloc = MealBloc(getMeals: mockGetMeals);
  });

  test('initial state should be MealInitial', () {
    expect(mealBloc.state, equals(MealInitial()));
  });

  blocTest<MealBloc, MealState>(
    'emits [MealLoading, MealLoaded] when FetchMealsEvent is added and GetMeals returns data',
    build: () {
      when(mockGetMeals.call(NoParams())).thenAnswer((_) async => [
            Meal(id: '1', name: 'Meal 1', category: 'Category 1', thumbnail: 'http://example.com/1.jpg', area: '', instructions: ''),
          ]);
      return mealBloc;
    },
    act: (bloc) => bloc.add(FetchMealsEvent()),
    expect: () => [
      MealLoading(),
      MealLoaded(meals: [
        Meal(id: '1', name: 'Meal 1', category: 'Category 1', thumbnail: 'http://example.com/1.jpg', area: '', instructions: ''),
      ]),
    ],
    verify: (_) {
      verify(mockGetMeals.call(NoParams())).called(1);  // Pasar NoParams directamente aquí
    },
  );

  blocTest<MealBloc, MealState>(
    'emits [MealLoading, MealError] when FetchMealsEvent is added and GetMeals throws an error',
    build: () {
      when(mockGetMeals.call(NoParams())).thenThrow(Exception('Failed to load meals'));
      return mealBloc;
    },
    act: (bloc) => bloc.add(FetchMealsEvent()),
    expect: () => [
      MealLoading(),
      MealError(message: 'Failed to load meals'),
    ],
    verify: (_) {
      verify(mockGetMeals.call(NoParams())).called(1);  // Pasar NoParams directamente aquí
    },
  );
}
