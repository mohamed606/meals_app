import 'package:flutter/material.dart';
import 'package:meals_app/routes.dart';

import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final globalTheme = Theme.of(context);
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: globalTheme.primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: globalTheme.textTheme.titleMedium,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.7),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      RoutesName.CATEGORIES_MEAL_SCREEN,
      arguments: {
        'id': category.id,
        'title': category.title,
      },
    );
  }
}
