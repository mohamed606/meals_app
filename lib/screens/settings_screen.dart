import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTiles({
    required String title,
    required String description,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      title: Text(
        title,
      ),
      subtitle: Text(
        description,
      ),
      value: value,
      activeColor: Theme.of(context).colorScheme.secondary,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTiles(
                  title: "Gluten-free",
                  description: "Only include gluten-free meals.",
                  value: _glutenFree,
                  onChanged: (value){
                    setState(() {
                      _glutenFree = value;
                    });
                  },
                ),
                _buildSwitchListTiles(
                  title: "Lactose-free",
                  description: "Only include lactose-free meals.",
                  value: _lactoseFree,
                  onChanged: (value){
                    setState(() {
                      _lactoseFree = value;
                    });
                  },
                ),
                _buildSwitchListTiles(
                  title: "Vegetarian",
                  description: "Only include vegetarian meals.",
                  value: _vegetarian,
                  onChanged: (value){
                    setState(() {
                      _vegetarian = value;
                    });
                  },
                ),
                _buildSwitchListTiles(
                  title: "Vegan",
                  description: "Only include vegan meals.",
                  value: _vegan,
                  onChanged: (value){
                    setState(() {
                      _vegan = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
