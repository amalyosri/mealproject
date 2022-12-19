import 'package:flutter/material.dart';
import 'package:mealupdate/models/meal.dart';
import 'package:mealupdate/widget/meal_item.dart';

class FavoriteScreean extends StatelessWidget {
  final List<Meal> favoritmeal;
  FavoriteScreean(this.favoritmeal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favoritmeal.isEmpty
          ? Center(
              child: Text("you have no favorite yet - star adding some !"),
            )
          : ListView.builder(
              itemCount: favoritmeal.length,
              itemBuilder: (ctx, index) {
                return MealItem(
                  id: favoritmeal[index].id,
                  title: favoritmeal[index].title,
                  imageUrl: favoritmeal[index].imageUrl,
                  duration: favoritmeal[index].duration,
                  complexity: favoritmeal[index].complexity,
                  affordability: favoritmeal[index].affordability,
                  // removeItem: _removemeal,
                );
              }),
    );
  }
}
