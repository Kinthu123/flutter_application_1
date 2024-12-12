import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'create_screen.dart';
import 'edit_screen.dart';
import 'splash_screen.dart'; // Import the SplashScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splash', // Set SplashScreen as the initial screen
      routes: {
        '/splash': (context) => const SplashScreen(), // Add SplashScreen route
        '/': (context) => const HomeScreen(),
        '/create': (context) => const CreateScreen(),
        '/edit': (context) => const EditScreen(),
      },
    );
  }
}
