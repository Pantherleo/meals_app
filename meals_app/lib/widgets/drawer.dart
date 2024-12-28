import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({super.key, required this.onSelected});
  void Function(String value) onSelected;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.69)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Row(
              children: [
                Icon(Icons.fastfood,
                    size: 48, color: Theme.of(context).colorScheme.onPrimary),
                const SizedBox(width: 12),
                Text('Cooking Up!',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary)),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.category,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            title: Text(
              'meals',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
            onTap: () {
              onSelected('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            title: Text(
              'Favourite',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
            onTap: () {
              onSelected('filters');
            },
          )
        ],
      ),
    );
  }
}
