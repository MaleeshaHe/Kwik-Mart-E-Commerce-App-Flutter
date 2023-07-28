import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kwik_mart/components/custom_poppins_text.dart';
import 'package:kwik_mart/screens/auth/singnin_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SingInPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Animate(
                  effects: [
                    FadeEffect(duration: 500.ms),
                    ScaleEffect(),
                  ],
                  child: Image(
                    width: size.width * 0.3,
                    image: const AssetImage('assets/images/splashLogo.png'),
                  ),
                ),
                Animate(
                  effects: [
                    FadeEffect(duration: 500.ms),
                  ],
                  child: Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 20),
                    child: CustomPoppinsText(
                      text: "Kwik Mart",
                      color: Colors.grey.shade500,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const CupertinoActivityIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
