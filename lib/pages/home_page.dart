import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  late double _deviceHeight, _deviceWidth;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          _astroImageWidget(), // Background image
          SafeArea(
            child: Container(
              height: _deviceHeight,
              width: _deviceWidth,
              child: _pageTitle(), // Centered title
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageTitle() {
    return const Text(
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
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
