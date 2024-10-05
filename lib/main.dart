import 'package:flutter/material.dart';
import 'package:recipe_app/screens/filters_screen.dart';
import 'package:recipe_app/screens/meal_detail_screen.dart';
import 'package:recipe_app/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliRecipes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodySmall: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => const FiltersScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
