import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

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
                    'Vegeterian', 'only include Vegeterian items', _vegetarian,
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
