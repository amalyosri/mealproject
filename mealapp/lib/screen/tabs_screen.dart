import 'package:flutter/material.dart';
import 'package:mealupdate/models/meal.dart';
import 'package:mealupdate/screen/category_screen.dart';
import 'package:mealupdate/widget/main_drawer.dart';

import 'favorite_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreen createState() => _TabScreen();
  final List<Meal> favoritmeal;
  TabScreen(this.favoritmeal);
}

class _TabScreen extends State<TabScreen> {
  @override
  List<Map<String, Object>>? _page;

  void initState() {
    super.initState();
    _page = [
      {"page": CategoriesScreen(), "title": "category"},
      {"page": FavoriteScreean(widget.favoritmeal), "title": "favorites"},
    ];
  }

  int _selectedpageindex = 0;
  void _selectpage(int value) {
    setState(() {
      _selectedpageindex = value;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_page![_selectedpageindex]["title"]}"),
      ),
      body: _page![_selectedpageindex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "favorit",
          ),
        ],
      ),
      drawer: MainScreen(),
    );
  }
}
