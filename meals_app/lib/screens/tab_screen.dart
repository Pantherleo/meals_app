import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/favprovider.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/widgets/drawer.dart';
import 'catergories.dart';

import 'filtersScreen.dart';
import 'package:meals_app/provider/meals_provider.dart';
import 'package:meals_app/provider/filters_provider.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  var selectPAgeIndex = 0;
  String message = '';
  Map<Filters, bool> kfilters = {
    Filters.glutenFree: false,
    Filters.lactoseFree: false,
    Filters.vegan: false,
    Filters.vegetarian: false
  };
  Map<Filters, bool> filters = {
    Filters.glutenFree: false,
    Filters.lactoseFree: false,
    Filters.vegan: false,
    Filters.vegetarian: false
  };

  void setScreen(String value) async {
    if (value == "filters") {
      Navigator.of(context)
          .pop(); // closing the drawer first then going bto filter screen
      var result = await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            saveFilters: filters,
          ),
        ),
      );

      setState(() {
        filters = result ?? kfilters;
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  // print(result);

  void showMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void selectScreen(int index) {
    setState(() {
      selectPAgeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsprovider);
    final filteredMealList = meals.where((meal) {
      if (filters[Filters.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }

      if (filters[Filters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (filters[Filters.vegetarian]! && !meal.isVegetarian) {
        return false;
      }

      if (filters[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activeScreen = CategoriesScreen(
      availableMeal: filteredMealList,
    );
    if (selectPAgeIndex == 1) {
      final favoriteMeal = ref.watch(favoriteMealsProvider);
      activeScreen = MealScreen(
        title: 'our Favorite',
        meal: favoriteMeal,
      );
    }
    return Scaffold(
      drawer: MainDrawer(onSelected: setScreen),
      appBar: AppBar(title: const Text('')),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectScreen,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categorys'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
    );
  }
}
