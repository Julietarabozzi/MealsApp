import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:meal_app/features/meals/data/datasources/meal_remote_data_source.dart';
import 'package:meal_app/features/meals/data/models/meal_model.dart';
import 'package:meal_app/features/meals/data/repositories/meal_repository_impl.dart';

class MockMealRemoteDataSource extends Mock implements MealRemoteDataSource {}

void main() {
  late MockMealRemoteDataSource mockRemoteDataSource;
  late MealRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockMealRemoteDataSource();
    repository = MealRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  final tMealModel = MealModel(
    id: '123',
    name: 'Test Meal',
    category: 'Test Category',
    instructions: 'Test Instructions',
    thumbnail: 'http://example.com/test.jpg',
    area: 'Test Area',
  );

  test('should return a list of meals when the call to remote data source is successful', () async {
    // Arrange
    when(mockRemoteDataSource.fetchMeals()).thenAnswer((_) async => [tMealModel]);

    // Act
    final result = await repository.getMeals();

    // Assert
    expect(result, [tMealModel]);
    verify(mockRemoteDataSource.fetchMeals());
    verifyNoMoreInteractions(mockRemoteDataSource);
  });

  test('should throw an exception when the call to remote data source fails', () async {
    // Arrange
    when(mockRemoteDataSource.fetchMeals()).thenThrow(Exception('Failed to load meals'));

    // Act
    final call = repository.getMeals();

    // Assert
    expect(() => call, throwsException);
    verify(mockRemoteDataSource.fetchMeals());
    verifyNoMoreInteractions(mockRemoteDataSource);
  });
}
