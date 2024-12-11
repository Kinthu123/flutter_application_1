import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use Future.delayed to delay the navigation to the HomeScreen
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to HomeScreen after 3 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.blue, // Choose your preferred color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.check_circle_outline, // Splash icon
              size: 100.0,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'To-Do List App',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
