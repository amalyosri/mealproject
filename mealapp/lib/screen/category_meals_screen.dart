import 'package:flutter/material.dart';
import 'package:mealupdate/models/meal.dart';
import 'package:mealupdate/widget/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  @override
  _CategoryMealsScreen createState() => _CategoryMealsScreen();
  // TODO: implement createState
  static const routeName = "category_meals";
  final List<Meal> availableMeal;
  CategoryMealsScreen(this.availableMeal);
}

class _CategoryMealsScreen extends State<CategoryMealsScreen> {
  @override
  String? caterogoryTitle;
  List<Meal>? displayMeals;
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routerg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routerg["id"];
    caterogoryTitle = routerg["title"];
    displayMeals = widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }

  void _removemeal(String id) {
    setState(() {
      displayMeals?.removeWhere((meal) => meal.id == id);
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text(caterogoryTitle!),
      ),
      body: ListView.builder(
          itemCount: displayMeals?.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayMeals![index].id,
              title: displayMeals![index].title,
              imageUrl: displayMeals![index].imageUrl,
              duration: displayMeals![index].duration,
              complexity: displayMeals![index].complexity,
              affordability: displayMeals![index].affordability,
              // removeItem: _removemeal,
            );
          }),
    );
  }
}
