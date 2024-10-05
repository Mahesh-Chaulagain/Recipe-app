import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> currentFilters;
  final Function(Map<String, bool>) saveFilters;
  const FiltersScreen(this.currentFilters, this.saveFilters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    super.initState();
    _glutenFree = widget.currentFilters['gluten'] ?? false;
    _lactoseFree = widget.currentFilters['lactose'] ?? false;
    _vegetarian = widget.currentFilters['vegetarian'] ?? false;
    _vegan = widget.currentFilters['vegan'] ?? false;
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue as void Function(bool)?,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Text('Adjust your meal selection',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                    'Vegetarian', 'only include Vegetarian items', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile('Gluten-free',
                    'only include gluten-free items', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Lactose-free',
                    'only include Lactose-free items',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'only include Vegan items', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
