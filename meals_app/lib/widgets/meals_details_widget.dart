/*import 'package:flutter/material.dart';
import 'package:meals_app/modals/meals.dart';

class MealsDetailsWidget extends StatelessWidget {
  MealsDetailsWidget({super.key, required this.meal});
  final Meal meal;
  List<String> A = [];
  List<String> B = [];

  @override
  Widget build(BuildContext context) {
    A = [];
    B = [];
    for (int i = 0; i < meal.ingredients.length; i++) {
      A.add(meal.ingredients[i]);
    }
    for (int j = 0; j < meal.steps.length; j++) {
      B.add(meal.steps[j]);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: Expanded(
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                  itemCount: A.length,
                  itemBuilder: (ctx, index) =>
                      Text(A[index], style: TextStyle(color: Colors.amber))),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: B.length,
                itemBuilder: (ctx, index) => Text(
                  B[index],
                  style: TextStyle(color: Colors.amber),
                ),
              ),
            ),
          ]),
        ));
  }
}



ListView.builder(
        itemCount: meal.ingredients.length,
        itemBuilder: (ctx, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(meal.ingredients[index],
                  style: const TextStyle(color: Colors.amber)),
              const SizedBox(
                height: 8,
              ),
              Text(meal.steps[index],
                  style: const TextStyle(color: Colors.amber)),
            ],
          ),
        ),
      )*/