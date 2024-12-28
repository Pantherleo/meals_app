import 'package:flutter/material.dart';
import 'package:meals_app/modals/meals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/favprovider.dart';

class Mealdetailscreen extends ConsumerWidget {
  Mealdetailscreen({super.key, required this.meal});

  //const Mealdetailscreen(
  //{super.key, required this.meal});

  final Meal meal;
  var d = true;
  //final Function(Meal meal) toggleFavorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favoriteMealsProvider).contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: const TextStyle(color: Colors.amber),
        ),
        actions: [
          IconButton(
              onPressed: () {
                //toggleFavorite(meal);
                var d = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavoriteStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        d ? 'Added to favorite' : 'Removed from favorite')));
              },
              icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    isFavorite ? Icons.star : Icons.star_border,
                    key: ValueKey(isFavorite),
                  ),
                  transitionBuilder: (child, animation) {
                    return RotationTransition(
                        turns: Tween<double>(begin: 0.8, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animation, curve: Curves.fastOutSlowIn),
                        ),
                        child: child);
                  })),
        ],
      ),
      body: Column(
        children: [
          Hero(
            tag: meal.id,
            child: Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(meal.ingredients.toString(),
              style: const TextStyle(color: Colors.amber)),
          const SizedBox(
            height: 50,
          ),
          Text(meal.steps.toString(),
              style: const TextStyle(color: Colors.amber)),
        ],
      ),
    );
  }
}
