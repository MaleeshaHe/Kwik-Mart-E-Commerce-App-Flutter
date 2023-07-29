import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kwik_mart/components/custom_poppins_text.dart';
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
    return Consumer<HomePageProvider>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Animate(
            effects: [FadeEffect(duration: 500.ms)],
            child: _mainPages[value.currentIndex],
          ),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNBIcon(
                text: "Home",
                icon: Icons.home,
                isActive: value.currentIndex == 0,
                onTap: () {
                  value.changeIndex(0);
                },
              ),
              BottomNBIcon(
                text: "Favorite",
                icon: Icons.favorite,
                isActive: value.currentIndex == 1,
                onTap: () {
                  value.changeIndex(1);
                },
              ),
              BottomNBIcon(
                text: "My Cart",
                icon: Icons.shopping_cart,
                isActive: value.currentIndex == 2,
                onTap: () {
                  value.changeIndex(2);
                },
              ),
              BottomNBIcon(
                text: "Profile",
                icon: Icons.people,
                isActive: value.currentIndex == 3,
                onTap: () {
                  value.changeIndex(3);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomNBIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;
  final String text;

  const BottomNBIcon({
    required this.icon,
    required this.isActive,
    required this.onTap,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Column(
        children: [
          IconButton(
            onPressed: onTap,
            icon: Icon(
              icon,
              color: isActive ? Colors.green : Colors.grey.shade500,
            ),
          ),
          CustomPoppinsText(
            text: text,
            fontSize: 10,
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
    );
  }
}
