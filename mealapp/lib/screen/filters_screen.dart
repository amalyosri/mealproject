import 'package:flutter/material.dart';
import 'package:mealupdate/widget/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  @override
  _FiltersScreen createState() => _FiltersScreen();

  Function savefilters;
  final Map<String, bool> currentfilter;
  FiltersScreen(
    this.savefilters,
    this.currentfilter,
  );
}

class _FiltersScreen extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentfilter['gluten'] ?? false;
    _vegetarian = widget.currentfilter['vegetarian'] ?? false;
    _vegan = widget.currentfilter['vegan'] ?? false;
    _lactoseFree = widget.currentfilter['lactose'] ?? false;

    super.initState();
  }

  Widget buildSwitch(String title, String desription, bool currentvalue,
      Function updatevalue) {
    return SwitchListTile(
      title: Text(title),
      value: currentvalue,
      onChanged: (val) => updatevalue(val),
      subtitle: Text(desription),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("filters"),
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> selectedFilers = {
                'gluten': _glutenFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
                'lactose': _lactoseFree,
              };

              widget.savefilters(selectedFilers);
            },
            icon: Icon(Icons.save),
            tooltip: "Click Here To Safe Your Filters",
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "AdJust your meal selection .",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          Expanded(
              child: ListView(children: [
            buildSwitch("Gluten", "only include glutenFree meals", _glutenFree,
                (val) {
              setState(() {
                _glutenFree = val;
              });
            }),
            buildSwitch(
                "lactose", "only include lactoseFree meals", _lactoseFree,
                (val) {
              setState(() => _lactoseFree = val);
            }),
            buildSwitch(
                "Vegetarian", "only include Vegetarian meals", _vegetarian,
                (val) {
              setState(() => _vegetarian = val);
            }),
            buildSwitch("Vegan", "only include Vegan meals", _vegan, (val) {
              setState(() => _vegan = val);
            }),
          ]))
        ],
      ),
      drawer: MainScreen(),
    );
  }
}
