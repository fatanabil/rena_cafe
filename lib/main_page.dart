import 'package:flutter/material.dart';
import 'menu_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';
import 'my_theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedNavbar = 0;

  final tabs = [
    const Center(child: MenuPage()),
    const Center(child: CartPage()),
    const Center(child: ProfilePage())
  ];

  void _changeSelectedNavbar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedNavbar],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        elevation: 20,
        currentIndex: _selectedNavbar,
        iconSize: 36,
        showUnselectedLabels: false,
        onTap: _changeSelectedNavbar,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.blue[200],
        selectedItemColor: priBlue,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }
}
