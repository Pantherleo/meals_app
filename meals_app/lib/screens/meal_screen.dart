import 'package:flutter/material.dart';
import 'package:meals_app/modals/meals.dart';
import 'package:meals_app/screens/mealDetailScreen.dart';
import 'package:meals_app/widgets/meals_item.dart';

class MealScreen extends StatelessWidget {
  MealScreen({
    super.key,
    this.title,
    required this.meal,
  });
  String? title;
  final List<Meal> meal;

  void selectCategory2(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (builderContext) => Mealdetailscreen(
                meal: meal,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meal.length,
      itemBuilder: (ctx, index) => MealsItem(
        meal: meal[index],
        selectToDetails: (context, meal) => selectCategory2(context, meal),
      ),
    );

    if (meal.isEmpty) {
      content = Expanded(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'No meal found',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.amber),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Try selexcting a different category",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.amber),
              ),
            ],
          ),
        ),
      );
    }
    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            title!,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        body: content);
  }
}
