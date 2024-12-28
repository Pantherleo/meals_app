import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier()
      : super({
          Filters.glutenFree: false,
          Filters.lactoseFree: false,
          Filters.vegan: false,
          Filters.vegetarian: false,
        });
  void setFilterss(Map<Filters, bool> mapfilter) {
    state = mapfilter;
  }

  void setFilters(Filters filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>((ref) {
  return FiltersNotifier();
});
