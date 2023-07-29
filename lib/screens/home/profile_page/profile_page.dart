import 'package:flutter/material.dart';
import 'package:kwik_mart/components/custom_poppins_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://static-01.daraz.lk/p/825a0d14604528f01b1ff003dc32f33c.jpg",
              width: 150,
            ),
            CustomPoppinsText(
              text: "Name",
              fontSize: 16,
            )
          ],
        ),
      ),
    );
  }
}
