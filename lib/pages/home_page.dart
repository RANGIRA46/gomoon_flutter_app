import 'package:flutter/material.dart';
import 'package:gomoon_flutter_app/widgets/custom_dropdown_button.dart'; // Import the CustomDropdownButton file

class HomePage extends StatelessWidget {
  late final double _deviceHeight, _deviceWidth;

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
                    width: _deviceWidth * 0.8, // 80% of screen width
                  ),
                  _travellerDropdownWidget(), // Dropdown for number of travelers
                ],
              ),
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
  Widget _travellerDropdownWidget() {
    return CustomDropdownButton(
      values: const ['1', '2', '3', '4'], // Dropdown items
      width: _deviceWidth * 0.45, // 45% of screen width
    );
  }

  /// Reusable method to create a gradient container
  Widget _buildGradientContainer({required Widget child}) {
    return Container(
      height: _deviceHeight,
      width: _deviceWidth,
      padding: EdgeInsets.symmetric(
        vertical: _deviceHeight * 0.1,
        horizontal: _deviceWidth * 0.05,
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