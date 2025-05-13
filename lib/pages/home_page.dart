import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageTitle()
    );
  }
Widget _pageTitle() {
  return Text(
    "#GoMoon",
    style: TextStyle(
      fontSize: 70,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
  );
}


  Widget _astroImageWidget() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home_background.png'),
          fit:
              BoxFit
                  .cover, // Change to `BoxFit.cover` for full-screen background
        ),
      ),
    );
  }
}
