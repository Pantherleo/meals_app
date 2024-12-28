import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/modals/category.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/modals/meals.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeal});

  // const CategoriesScreen({super.key, required this.toggleFavourite, required this.availableMeal});

  final List<Meal> availableMeal;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    // _animationController.stop();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void selectCategory(BuildContext context, Category category) {
    final listOfMeals = widget.availableMeal
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
    return AnimatedBuilder(
      animation: _animationController,
      child: Scaffold(
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            for (final category in availableCategories)
              CategoryGridItem(
                  category: category,
                  onSelectCategory: (context) {
                    selectCategory(context, category);
                  }) /* important concept of using bulder context and navigator together
                    need to be understood in the best possible outcome */
          ],
        ),
      ),
      builder: (context, child) =>
          /*Padding(
        padding: EdgeInsets.only(top: 100 - _animationController.value * 100),
        child: child,
      ),*/
          SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOut,
        )),
        child: child,
      ),
    );
  }
}
