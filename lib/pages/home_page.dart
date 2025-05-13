import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.grey, // Fallback color in case the image fails to load
          image: DecorationImage(
            image: AssetImage('assets/images/home_background.png'),
            fit: BoxFit.cover, // Change to `BoxFit.cover` for full-screen background
          ),
        ),
      ),
    );
  }
}