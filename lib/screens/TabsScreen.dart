import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';
import '../widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _pages = [
    const CategoriesScreen(),
    const FavoritesScreen(),
  ];
  final List<String> _pageTitles = [
    "Categories",
    "Your Favorites",
  ];
  int _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pageTitles[_selectedPageIndex],
        ),
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
      body: _pages[_selectedPageIndex],
    );
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
}
