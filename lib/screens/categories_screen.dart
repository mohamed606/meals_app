import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/dummy_data.dart';

import '../models/category.dart';

class CategoriesScreen extends StatelessWidget {

  const CategoriesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: _categoryItemBuilder,
        itemCount: DUMMY_CATEGORIES.length,
      ),
    );
  }

  Widget _categoryItemBuilder(BuildContext context, int index) {
    Category category = DUMMY_CATEGORIES[index];
    return CategoryItem(category: category,);
  }
}
