import 'package:meals_app/screens/TabsScreen.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

import 'screens/category_meals_screen.dart';


class RoutesName {
  static const HOME_SCREEN = "/";
  static const CATEGORIES_MEAL_SCREEN = "/category-meals";
  static const MEAL_DETAIL_SCREEN = "/meal-detail";
}

final routes = {
  RoutesName.HOME_SCREEN: (context) => const TabScreen(),
  RoutesName.CATEGORIES_MEAL_SCREEN: (context) => const CategoryMealsScreen(),
  RoutesName.MEAL_DETAIL_SCREEN: (context) => const MealDetailScreen(),
};
