import 'package:flutter/material.dart';
import 'package:mealupdate/screen/filters_screen.dart';

class MainScreen extends StatelessWidget {
  Widget buildlisttile(IconData icon, String title, Function taphandlr) {
    return ListTile(
        title: Text(title,
            style: const TextStyle(
                fontSize: 26,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold)),
        leading: Icon(
          icon,
          size: 26,
        ),
        onTap: () => taphandlr());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          buildlisttile(Icons.restaurant, "Meal", () {
            Navigator.of(context).pushNamed("/");
          }),
          buildlisttile(Icons.settings, "Filters", () {
            Navigator.of(context).pushNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
