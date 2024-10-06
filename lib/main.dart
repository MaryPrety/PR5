// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'pages/manga_selected.dart';
import 'pages/authorization.dart';
import 'providers/favorite_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MANgo100',
      theme: ThemeData(
        fontFamily: 'Russo One',
        scaffoldBackgroundColor: const Color.fromRGBO(45, 66, 99, 1),
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(45, 66, 99, 1),
          iconTheme: IconThemeData(color: Color(0xFFECDBBA)),
          titleTextStyle: TextStyle(
            color: Color(0xFFECDBBA),
            fontFamily: 'Russo One',
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromRGBO(45, 66, 99, 1),
          selectedItemColor: Color.fromRGBO(200, 75, 49, 1),
          unselectedItemColor: Color(0xFFECDBBA),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    MangaSelectedPage(),
    Authorization(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Авторизация',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(200, 75, 49, 1),
        unselectedItemColor: const Color(0xFFECDBBA),
        onTap: _onItemTapped,
      ),
    );
  }
}