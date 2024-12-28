import 'package:flutter/material.dart';

import 'package:meals_app/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  FiltersScreen({super.key, required this.saveFilters});
  Map<Filters, bool> saveFilters;
  @override
  ConsumerState<FiltersScreen> createState() {
    return FiltersscreenState();
  }
}

class FiltersscreenState extends ConsumerState<FiltersScreen> {
  var glutenFreefilter = false;
  var lactoseFreefilter = false;
  var veganFreefilter = false;
  var vegetarianFreefilter = false;
  @override
  void initState() {
    super.initState();

    /*glutenFreefilter = widget.saveFilters[Filters.glutenFree] ?? false;
    lactoseFreefilter = widget.saveFilters[Filters.lactoseFree] ?? false;
    veganFreefilter = widget.saveFilters[Filters.vegan] ?? false;
    vegetarianFreefilter = widget.saveFilters[Filters.vegetarian] ?? false;*/

    final dd = ref.read(filtersProvider);
    glutenFreefilter = dd[Filters.glutenFree] ?? false;
    lactoseFreefilter = dd[Filters.lactoseFree] ?? false;
    veganFreefilter = dd[Filters.vegan] ?? false;
    vegetarianFreefilter = dd[Filters.vegetarian] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*drawer: MainDrawer(
        onSelected: (String value) {
          Navigator.of(context).pop();
          if (value == "meals") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => TabScreen()));
          }
        },
      ),*/
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          /* Navigator.of(context).pop({
            Filters.glutenFree: glutenFreefilter,
            Filters.lactoseFree: lactoseFreefilter,
            Filters.vegan: veganFreefilter,
            Filters.vegetarian: vegetarianFreefilter
          });*/
          /*basically popfunc sets the func of how the things would be done in pretext of the 
          back button of the filters page,what value will be passed and what does the function would actuallty do */
          ref.watch(filtersProvider.notifier).setFilterss({
            Filters.glutenFree: glutenFreefilter,
            Filters.lactoseFree: lactoseFreefilter,
            Filters.vegan: veganFreefilter,
            Filters.vegetarian: vegetarianFreefilter
          });

          return true;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenFreefilter,
              onChanged: (isChecked) {
                setState(() {
                  glutenFreefilter = isChecked;
                });
              },
              title: const Text('Gluten-free',
                  style: TextStyle(color: Colors.amber)),
              subtitle: const Text('!'),
              activeColor: Colors.purple,
              contentPadding: const EdgeInsets.all(20),
            ),
            SwitchListTile(
              value: lactoseFreefilter,
              onChanged: (isChecked) {
                setState(() {
                  lactoseFreefilter = isChecked;
                });
              },
              title: const Text('Lactose-free',
                  style: TextStyle(color: Colors.amber)),
            ),
            SwitchListTile(
              value: veganFreefilter,
              onChanged: (isChecked) {
                setState(() {
                  veganFreefilter = isChecked;
                });
              },
              title: const Text('vegan', style: TextStyle(color: Colors.amber)),
            ),
            SwitchListTile(
              value: vegetarianFreefilter,
              onChanged: (isChecked) {
                setState(() {
                  vegetarianFreefilter = isChecked;
                });
              },
              title: const Text('vegetarian',
                  style: TextStyle(color: Colors.amber)),
            ),
          ],
        ),
      ),
    );
  }
}
