// lib/features/meals/presentation/pages/meals_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/features/meals/presentation/bloc/meal_bloc.dart';
import 'package:meal_app/features/meals/presentation/pages/meal_details_page.dart';
import 'package:meal_app/injection_container.dart' as di;

class MealsPage extends StatelessWidget {
  const MealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<MealBloc>()..add(FetchMealsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
        ),
        body: BlocBuilder<MealBloc, MealState>(
          builder: (context, state) {
            if (state is MealLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MealLoaded) {
              return ListView.builder(
                itemCount: state.meals.length,
                itemBuilder: (context, index) {
                  final meal = state.meals[index];
                  return ListTile(
                    leading: Image.network(meal.thumbnail),
                    title: Text(meal.name),
                    subtitle: Text(meal.category),
                    onTap: () {
                      // Navegar a MealDetailPage y pasar la comida seleccionada
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealDetailPage(meal: meal),
                        ),
                      );
                    },
                  );
                },
              );
            } else if (state is MealError) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
