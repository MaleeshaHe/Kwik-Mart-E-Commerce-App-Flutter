import 'package:flutter/material.dart';
import 'package:kwik_mart/providers/homepage_provider.dart';
import 'package:kwik_mart/screens/home/cart/cart.dart';
import 'package:kwik_mart/screens/home/favourite/favourite_page.dart';
import 'package:kwik_mart/screens/home/home_page.dart';
import 'package:kwik_mart/screens/home/profile_page/profile_page.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _mainPages = [
    const HomePage(),
    const FavouritePage(),
    const MyCart(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: _mainPages[value.currentIndex],
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNBIcon(
              icon: Icons.home,
              isActive: true,
              onTap: () {
                value.changeIndex(0);
              },
            ),
            BottomNBIcon(
              icon: Icons.favorite,
              isActive: false,
              onTap: () {
                value.changeIndex(1);
              },
            ),
            BottomNBIcon(
              icon: Icons.shopping_cart,
              isActive: false,
              onTap: () {
                value.changeIndex(2);
              },
            ),
            BottomNBIcon(
              icon: Icons.people,
              isActive: false,
              onTap: () {
                value.changeIndex(3);
              },
            ),
          ],
        ),
      );
    });
  }
}

class BottomNBIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const BottomNBIcon({
    required this.icon,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: isActive ? Colors.green : Colors.grey.shade500,
      ),
    );
  }
}
