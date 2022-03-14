import 'package:meals_app/dummy_data.dart';

import 'models/meal.dart';

class MealUtil {
  static List<Meal> getMealsWithCategoryId(String categoryId) {
    return DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }

  static String complexityText(Complexity complexity) {
    if (complexity == Complexity.Simple)
      return "Simple";
    else if (complexity == Complexity.Challenging)
      return "Challenging";
    else if (complexity == Complexity.Hard)
      return "Hard";
    else
      return "can't match complexity";
  }

  static String affordabilityText(Affordability affordability) {
    if (affordability == Affordability.Affordable)
      return "Affordable";
    else if (affordability == Affordability.Luxurious)
      return "Expensive";
    else if (affordability == Affordability.Pricey)
      return "Pricey";
    else
      return "can't match affordability";
  }

  static Meal getMealById(String mealId) {
    return DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
  }
}
