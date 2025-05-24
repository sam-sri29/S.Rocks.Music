import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:s_rocks_music/View/home.dart';

class BottonNavbar extends StatefulWidget {
  const BottonNavbar({super.key});

  @override
  State<BottonNavbar> createState() => _BottonNavbarState();
}

class _BottonNavbarState extends State<BottonNavbar> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    Home(),
    Center(
      child: Text(
        "News",
        style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 24)),
      ),
    ),
    Center(
      child: Text(
        "Tracks",
        style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 24)),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade700,
        onTap: (index) => setState(() => _currentIndex = index),
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper, color: Colors.white),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note, color: Colors.white),
            label: 'Tracks',
          ),
        ],
      ),
    );
  }
}
