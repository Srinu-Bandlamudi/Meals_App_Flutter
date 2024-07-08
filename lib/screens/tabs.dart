import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedPageIndex=0;
  void _selectedPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage=const CategoriesScreen();
    var activerPageTitle='Categories';
    if(_selectedPageIndex==1){
      activePage=const MealsScreen(meals: []);
      activerPageTitle='Your Favoutites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activerPageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap:_selectedPage,
        currentIndex: _selectedPageIndex,
        items: const[
            BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Favourites'),
      ],),
    );
  }
}
