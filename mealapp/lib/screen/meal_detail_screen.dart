import 'package:flutter/material.dart';
import 'package:mealupdate/dummy_data.dart';

class MealDetail extends StatefulWidget {
  @override
  static const routeName = "detail_meals";
  final Function togglefavorites;
  final Function ismealfavorite;

  const MealDetail(this.togglefavorites, this.ismealfavorite);

  @override
  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  Widget buildsectionTitle(BuildContext ctx, String title) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(ctx).textTheme.bodyText2,
        ));
  }

  bool _switch = true;
  Widget buildcontinar(Widget chid) {
    return Container(
        height: 150,
        width: 300,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: chid);
  }

  Widget build(BuildContext context) {
    // TODO: implement build

    final mealID =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final mealID1 = mealID["ID"];
    final selectmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID1);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectmeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectmeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildsectionTitle(context, "ingradiant"),
            buildcontinar(ListView.builder(
              itemBuilder: (context, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(selectmeal.ingredients[index]),
                ),
              ),
              itemCount: selectmeal.ingredients.length,
            )),
            buildsectionTitle(context, "Steps"),
            buildcontinar(ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    title: Text(selectmeal.steps[index]),
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  )
                ],
              ),
              itemCount: selectmeal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.togglefavorites(mealID1);
          // Navigator.of(context).pop(mealID1);
        },
        child:
            Icon(widget.ismealfavorite(mealID1) ? Icons.star : Icons.star_border
                // widget.ismealfavorite(mealID1)
                ),
      ),
    );
  }
}
