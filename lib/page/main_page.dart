import 'package:flutter/material.dart';
import 'package:wallpaper_app/page/home_page.dart';
import 'package:wallpaper_app/page/liked_page.dart';
import 'package:wallpaper_app/widget/my_bottom_nav.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final _pages = [
    HomePage(),
    LikedPage(),
    Container(),
    Container(),
  ];
  final _titles = [
    "Home",
    "Popular",
    "Refresh",
    "Favorite"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_currentIndex]),surfaceTintColor: Colors.transparent,),
      drawer: _drawer(),
      body: Stack(
        children: [
          Expanded(child: _pages[_currentIndex]),
          Positioned(bottom: 0,right: 0,left: 0,child: MyBottomNav(
            onClick: (v) => setState(() { _currentIndex = v; }),
            index: _currentIndex,
          ))
        ],
      )
    );
  }
  _drawer() {
    return Drawer(
      backgroundColor: const Color(0xFF152C3F),
      child: Column(
        children: [
          const SizedBox(height: 60,),
          ListTile(
            leading: Image.asset('assets/img/group.png'),
            title: const Text("4K",style: TextStyle(fontSize: 20),),
            subtitle: const Text("Wallpapers",style: TextStyle(fontSize: 20),),
          ),
          const SizedBox(height: 20,),
          ListTile(
            title: const Text("History"),
            leading: Image.asset('assets/img/history.png',width: 30,height: 30,),
          ),
          ListTile(
            title: const Text("About"),
            leading: Image.asset('assets/img/about.png',width: 30,height: 30,),
          ),
        ],
      ),
    );
  }
}
