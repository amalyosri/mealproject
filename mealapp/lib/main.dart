import 'package:flutter/material.dart';
import 'package:mealupdate/models/meal.dart';
import 'dummy_data.dart';
import 'screen/category_meals_screen.dart';
import 'screen/filters_screen.dart';
import 'screen/meal_detail_screen.dart';
import 'screen/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  @override
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan ": false,
    " vegetarian": false,
  };
  List<Meal> _availableMeal = DUMMY_MEALS;

  List<Meal> _favoriteMeals = [];

  void _togglefavorite(String id) {
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == id);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  void _setfilter(Map<String, bool> _filtersData) {
    setState(() {
      _filters = _filtersData;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters["gluten"] == true && meal.isGlutenFree == false) {
          return false;
        }

        if (_filters["lactose"] == true && meal.isLactoseFree == false) {
          return false;
        }
        if (_filters["vegan"] == true && meal.isVegan == false) {
          return false;
        }
        if (_filters["vegetarian"] == true && meal.isGlutenFree == false) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            bodyText2: const TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold)),
      ),
      routes: {
        "/": (context) => TabScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(
              _availableMeal,
            ),
        MealDetail.routeName: (context) =>
            MealDetail(_togglefavorite, _isMealFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_setfilter, _filters),
      },
    );
  }
}
