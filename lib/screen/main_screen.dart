import 'package:flutter/material.dart';
import 'package:mad/screen/account_screen.dart';
import 'package:mad/screen/cart_screen.dart';
import 'package:mad/screen/favorite_screen.dart';
import 'package:mad/screen/home_screen.dart';
import 'package:mad/screen/search_screen.dart';
import 'package:mad/widgets/app_color.dart' as appColor;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;

  List<Widget> screenList = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    CartScreen(),
    AccountScreen()
  ];

  void _onTabClick(int currentIndex){
    setState(() {
      _currentIndex = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<BottomNavigationBarItem> bottomNavItems = [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
      BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
    ];

    final bottomNavBar = BottomNavigationBar(
      fixedColor: Colors.pinkAccent,
      type: BottomNavigationBarType.fixed,
      backgroundColor: appColor.app_background,
      items: bottomNavItems,
      currentIndex: _currentIndex,
      onTap: _onTabClick,
      selectedFontSize: 15,
      unselectedFontSize: 13,
    );

    return Scaffold(
      body: SafeArea(
          child: screenList.elementAt(_currentIndex)
      ),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
