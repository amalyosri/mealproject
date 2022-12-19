import 'package:flutter/material.dart';
import 'package:mealupdate/models/meal.dart';
import 'package:mealupdate/screen/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  @override
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  // final Function removeItem;

  const MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    // required this.removeItem,
  });

  static const routeName = "category_meals";
  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetail.routeName, arguments: {"ID": id}).then((value) {
      //removeItem(value);
    });
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "simple";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      case Complexity.Challenging:
        return "challenging";
        break;
      default:
        return "unKnown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Luxurious:
        return "luxurious";
        break;
      case Affordability.Pricey:
        return "price";
        break;
      case Affordability.Affordable:
        return "affordable";
        break;
      default:
        return "unKnown";
    }
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 220,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: TextStyle(color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.schedule),
                    ),
                    Text("$duration min")
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.work),
                    ),
                    Text("$complexityText")
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.attach_money),
                    ),
                    Text("$affordabilityText")
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
