import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:music_app/pages/discover_page.dart';
import 'package:music_app/pages/favourite_page.dart';
import 'package:music_app/pages/music_page.dart';
import 'package:music_app/utils/api_service.dart';

class HomeScreen extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<Widget> _pages = [
    DiscoverPage(),
    MusicPage(),
    FavoritePage(),
  ];
  int _currentIndex = 0;
  String username = "Default\nName";
  void _updateindex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> getUsername() async {
    try {
      dynamic userDetails = await ApiService.getUserName();
      setState(() {
        username = "${userDetails["firstname"]}\n${userDetails["lastname"]}";
      });
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(245, 39, 16, 60),
        // backgroundColor: LinearGradient(colors: colors),
        width: 240,
        child: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage("assets/avatar2.jpg"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 8),
                child: Text(
                  "Hi!!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text(
                username,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                  _scaffoldKey.currentState?.closeDrawer();
                },
                leading: Icon(
                  Icons.home,
                  color: Colors.white70,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                  _scaffoldKey.currentState?.closeDrawer();
                },
                leading: Icon(
                  Icons.person,
                  color: Colors.white70,
                ),
                title: Text(
                  "Artist",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                  _scaffoldKey.currentState?.closeDrawer();
                },
                leading: Icon(
                  Icons.favorite,
                  color: Colors.white70,
                ),
                title: Text(
                  "Favorite",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextButton(
                  onPressed: () {
                    ApiService.logout();
                    Navigator.pushReplacementNamed(context, "/lg");
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 40, 4, 46),
        leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/avatar2.jfif"),
              ),
            )),
        title: Text(
          "Discover",
          style: TextStyle(color: Colors.white),
        ),
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
