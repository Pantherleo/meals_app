import 'package:flutter/material.dart';
import 'package:meals_app/modals/meals.dart';
import 'package:meals_app/widgets/meals_item_trairt.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsItem extends StatelessWidget {
  MealsItem({
    super.key,
    required this.meal,
    required this.selectToDetails,
  });

  final Meal meal;

  void Function(BuildContext context, Meal meal) selectToDetails;

  /*void selectCategory2(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builderContext) => MealsDetailsWidget(
          meal: meal,
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      semanticContainer: true,
      child: InkWell(
        onTap: () {
          selectToDetails(context, meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 44,
                ),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealsItemTrairt(
                              icon: Icons.timer, label: '${meal.duration} min'),
                          const SizedBox(width: 10),
                          MealsItemTrairt(
                              icon: Icons.work, label: meal.complexity.name),
                          const SizedBox(width: 10),
                          MealsItemTrairt(
                              icon: Icons.attach_money,
                              label: meal.affordability.name),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
