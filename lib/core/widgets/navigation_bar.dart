import 'package:flutter/material.dart';
import 'package:to_do_app/router/routes.dart';

class NavigationBarWidget {
  static BottomNavigationBar content(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _index,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.5),
      backgroundColor: Colors.deepOrange,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Tasks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.archive),
          label: 'Archives',
        ),
      ],
      onTap: (index) => _changeIndex(context, index),
    );
  }

  static int _index = 0;

  static final Map<int, String> _routes = {
    0: RouteAliasData.tasks,
    1: RouteAliasData.archives,
  };

  static void _changeIndex(BuildContext context, int index) {
    _index = index;
    Navigator.of(context).pushReplacementNamed(_routes[index]!);
  }
}
