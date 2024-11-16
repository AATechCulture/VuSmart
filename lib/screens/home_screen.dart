import 'package:flutter/material.dart';
import 'package:parentapp/screens/marketplace_screen.dart';
import 'package:parentapp/screens/meal_planning_screen.dart';
import 'package:parentapp/screens/financial_dashboard_screen.dart';
import 'package:parentapp/screens/map_screen.dart';
import 'package:parentapp/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  
  final List<Widget> _screens = [
    const MarketplaceScreen(),
    const MealPlanningScreen(),
    const FinancialDashboardScreen(),
    const MapScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Market'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Meals'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: 'Finance'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
