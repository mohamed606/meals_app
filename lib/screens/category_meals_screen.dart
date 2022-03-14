import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../meal_util.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = _extractRoutArguments(context);
    final String categoryId = routeArgs['id']!;
    final String categoryTitle = routeArgs['title']!;
    final List<Meal> categoryMeals =
        MealUtil.getMealsWithCategoryId(categoryId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => mealItemBuilder(categoryMeals[index]),
        itemCount: categoryMeals.length,
      ),
    );
  }

  Map<String, String> _extractRoutArguments(BuildContext context) {
    return ModalRoute.of(context)!.settings.arguments as Map<String, String>;
  }

  Widget mealItemBuilder(meal) {
    return MealItem(meal: meal);
  }
}
