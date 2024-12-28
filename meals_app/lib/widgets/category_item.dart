import 'package:flutter/material.dart';
import 'package:meals_app/modals/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });
  final Category category;
  final void Function(BuildContext) onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectCategory(context);
      },
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.1),
                category.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}
