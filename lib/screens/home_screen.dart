import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:music_app/pages/discover_page.dart';
import 'package:music_app/pages/favourite_page.dart';
import 'package:music_app/pages/music_page.dart';

class HomeScreen extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  List<Widget> _pages = [
    DiscoverPage(),
    MusicPage(),
    FavouritePage(),
  ];
  int _currentIndex = 0;
  void _updateindex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 4, 46),
        leading: CircleAvatar(
          backgroundColor: Colors.pink,
        ),
        title: Text(
          "Discover",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ))
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: const Color.fromARGB(255, 40, 4, 46),
        selectedIndex: _currentIndex,
        onItemSelected: _updateindex,
        items: [
          BottomNavyBarItem(
              activeColor: Colors.white,
              icon: Icon(Icons.home),
              title: Text("Discover")),
          BottomNavyBarItem(
              activeColor: Colors.white,
              icon: Icon(Icons.library_music),
              title: Text("Music")),
          BottomNavyBarItem(
              activeColor: Colors.white,
              icon: Icon(Icons.favorite),
              title: Text("Likes")),
        ],
      ),
    );
  }
}
