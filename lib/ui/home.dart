import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/bottom_navigation_provider.dart';
import 'package:provider_test/ui/first.dart';

import 'movie_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  BottomNavitionProvider _bottomNavitionProvider = BottomNavitionProvider();

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: "movie",
        )
      ],
      currentIndex: _bottomNavitionProvider.currentNavigationIndex,
      selectedItemColor: Colors.red,
      onTap: (i) {
        _bottomNavitionProvider.updatePage(i);
      },
    );
  }

  Widget _navigationBody() {
    //navigation index
    switch (_bottomNavitionProvider.currentNavigationIndex) {
      case 0:
        return First();

      case 1:
        return MovieList();
       /* return Center(
          child: Container(
            child: Text('2 Container'),
          ),
        );*/
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    //provier intance

    _bottomNavitionProvider = Provider.of<BottomNavitionProvider>(context);

    return Scaffold(
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
