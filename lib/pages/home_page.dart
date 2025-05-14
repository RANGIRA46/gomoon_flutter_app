import 'package:flutter/material.dart';
import 'package:gomoon_flutter_app/widgets/custom_dropdown_button.dart'; // Import the CustomDropdownButton file

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize device dimensions within the build method
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          _astroImageWidget(), // Background image
          SafeArea(
            child: _buildGradientContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _pageTitle(), // Centered title
                  CustomDropdownButton(
                    values: [
                      'Johnson Webb Station',
                      'Baraka Station',
                    ], // Dropdown items
                    width: deviceWidth * 0.8, // 80% of screen width
                  ),
                  _travellerDropdownWidget(deviceWidth), // Dropdown for number of travelers
                ],
              ),
              deviceHeight: deviceHeight,
              deviceWidth: deviceWidth,
            ),
          ),
        ],
      ),
    );
  }

  /// Widget for the page title
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

  /// Widget for the astronaut background image
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

  /// Widget for the traveler dropdown (e.g., number of travelers)
  Widget _travellerDropdownWidget(double deviceWidth) {
    return CustomDropdownButton(
      values: const ['1', '2', '3', '4'], // Dropdown items
      width: deviceWidth * 0.45, // 45% of screen width
    );
  }

  /// Reusable method to create a gradient container
  Widget _buildGradientContainer({
    required Widget child,
    required double deviceHeight,
    required double deviceWidth,
  }) {
    return Container(
      height: deviceHeight,
      width: deviceWidth,
      padding: EdgeInsets.symmetric(
        vertical: deviceHeight * 0.1,
        horizontal: deviceWidth * 0.05,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(31, 31, 31, 0.8),
            Color.fromRGBO(31, 31, 31, 0.5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}