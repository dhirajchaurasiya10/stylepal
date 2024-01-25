import 'package:flutter/material.dart';
import 'package:stylepal/screens/Favourites.dart';


import 'package:stylepal/screens/homescreen.dart';
import 'package:stylepal/screens/profile.dart';
import 'package:stylepal/shuffledimage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List screens = [
    ShuffledImageGrid(),
    Favourites(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopify"),
        backgroundColor: Color.fromARGB(255, 29, 62, 72),
        centerTitle: true,
      ),
      body: ShuffledImageGrid(),
      // screens[currentIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   onTap: (value) {
      //     setState(() => currentIndex = value);
      //   },
      //   selectedItemColor: Color.fromARGB(255, 29, 62, 72),
      //   unselectedItemColor: const Color.fromARGB(255, 192, 190, 190),
      //   items: [
      //     BottomNavigationBarItem(
      //       label: "Home",
      //       icon: Icon(Icons.home),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "Favorite",
      //       icon: Icon(Icons.favorite),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "Profile",
      //       icon: Icon(Icons.person),
      //     ),
      //   ],
      // ),
    );
  }
}
