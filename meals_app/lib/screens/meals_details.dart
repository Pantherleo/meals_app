/*import 'package:flutter/material.dart';
import 'package:meals_app/modals/meals.dart';
import 'package:meals_app/data/dummy_data.dart';

class MealsDetails extends StatelessWidget {
  const MealsDetails({super.key, required this.meal});
  final Meal meal;
  void selectCategory(BuildContext context, Category category) {
    final listOfMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builderContext) => MealScreen(
          title: category.title,
          meal: listOfMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: ListView.builder());
  }
}*/
