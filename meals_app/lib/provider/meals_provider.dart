import 'package:meals_app/data/dummy_data.dart';
import 'package:riverpod/riverpod.dart';

var mealsprovider = Provider((ref) {
  return dummyMeals;
});
