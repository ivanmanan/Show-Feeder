import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "home/home_widget.dart";
import "favorites/favorites_widget.dart";
import "add_show/add_show_widget.dart";
import "models/data.dart";

class Interface extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InterfaceState();
  }
}

class _InterfaceState extends State<Interface> {

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget screens(BuildContext context, int index) {
		switch(index) {
      case 0:
        return Consumer<Data>(
          builder: (context, data, child) => Home(
            data.fetchMonthYearFavoritesMap(),
            data.fetchYearMonthsMap(),
            data.fetchTitleInfoMap()
          ),
        );
      case 1:
        return Consumer<Data>(
          builder: (context, data, child) => Favorites(
            data.fetchFavoriteShows()
          ),
        );
      case 2:
      default:
        return AddShow();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Feeder'),
      ),
      body: screens(context, _currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
		      BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              title: Text('Add Show'))
        ],
        onTap: onTabTapped,
        currentIndex: _currentIndex,
      ),
    );
  }
}
