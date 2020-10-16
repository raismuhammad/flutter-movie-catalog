import 'package:flutter/material.dart';
import 'package:movie_catalog/screen/discover.dart';
import 'package:movie_catalog/screen/trending.dart';
import 'package:movie_catalog/screen/favorite.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Discover(),
    Trending(),
    Favorite(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex),),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            title: Text("DISCOVER"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            title: Text("TRENDING"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("FAVORITE"),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
