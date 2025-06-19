import 'package:auvnet_internship_assessment/core/theme/app_colors.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/screens/tabs/cart_tab.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/screens/tabs/categories_tab.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/screens/tabs/delivery_tab.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/screens/tabs/home_tab.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/screens/tabs/profile_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final Map<String, Widget> _tabs = {
    'Home': HomeTab(),
    'Categories': CategoriesTab(),
    'Deliver': DeliverTab(),
    'Cart': CartTab(),
    'Profile': ProfileTab(),
  };
  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
    BottomNavigationBarItem(
      icon: Icon(Icons.category_outlined),
      label: 'Categories',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.delivery_dining_outlined),
      label: 'Delivery',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs.values.toList()[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.titleText,

        currentIndex: _currentIndex,
        onTap: (value) => setState(() => _currentIndex = value),
        items: _items,
      ),
    );
  }
}
