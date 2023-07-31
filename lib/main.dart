import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kwik_mart/firebase_options.dart';
import 'package:kwik_mart/providers/admin_provider.dart';
import 'package:kwik_mart/providers/homepage_provider.dart';
import 'package:kwik_mart/providers/signin_provider.dart';
import 'package:kwik_mart/providers/signup_provider.dart';
import 'package:kwik_mart/providers/user_provider.dart';
import 'package:kwik_mart/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdminProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kwik Mart Shopping App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
