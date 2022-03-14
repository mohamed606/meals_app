import 'package:flutter/material.dart';
import 'routes.dart';
import 'theme/theme_light.dart';

import 'screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: lightTheme,
      routes: routes,
    );
  }
}