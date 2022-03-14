import 'package:flutter/material.dart';
import 'package:meals_app/meal_util.dart';

import '../models/meal.dart';
import '../routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({Key? key, required this.meal}) : super(key: key);

  Widget mealInfo({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 6,
        ),
        Text(
          text,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          RoutesName.MEAL_DETAIL_SCREEN,
          arguments: {
            "mealId": meal.id,
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 250,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: mealInfo(
                      icon: Icons.schedule,
                      text: "${meal.duration} min",
                    ),
                  ),
                  Expanded(
                    child: mealInfo(
                      icon: Icons.work,
                      text: MealUtil.complexityText(meal.complexity),
                    ),
                  ),
                  Expanded(
                    child: mealInfo(
                      icon: Icons.attach_money,
                      text: MealUtil.affordabilityText(meal.affordability),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
