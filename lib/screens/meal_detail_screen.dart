import 'package:flutter/material.dart';
import 'package:meals_app/meal_util.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String mealId = _extractRoutArguments(context)['mealId']!;
    final Meal meal = MealUtil.getMealById(mealId);
    final globalTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(
              context: context,
              text: "Ingredients",
            ),
            buildContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index) =>
                    _ingredientItemBuilder(context, meal.ingredients[index]),
              ),
            ),
            buildSectionTitle(
              context: context,
              text: "Steps",
            ),
            buildContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            "#${index + 1}",
                          ),
                        ),
                        title: Text(
                          meal.steps[index],
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, String> _extractRoutArguments(BuildContext context) {
    return ModalRoute.of(context)!.settings.arguments as Map<String, String>;
  }

  Widget _ingredientItemBuilder(context, String ingredient) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Text(
          ingredient,
        ),
      ),
    );
  }

  Widget buildSectionTitle({
    required BuildContext context,
    required String text,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }
}
