import 'package:flutter/material.dart';

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
            child: Container(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  _pageTitle(), // Centered title
                  const SizedBox(
                    height: 20,
                  ), // Space between title and dropdown
                  _destinationDropDownWidget(), // Dropdown widget
                ],
              ),
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

  Widget _destinationDropDownWidget() {
    return DropdownButton<String>(
      value: null, // Initial value of the dropdown
      hint: const Text(
        'Select Destination',
        style: TextStyle(color: Colors.white),
      ),
      dropdownColor: Colors.black,
      onChanged: (String? newValue) {
        // Handle selection change
      },
      items: const [
        DropdownMenuItem(
          value: 'Johnson Webb Station',
          child: Text(
            'Johnson Webb Station',
            style: TextStyle(color: Colors.white),
          ),
        ),
        DropdownMenuItem(
          value: 'Baraka Station',
          child: Text('Baraka Station', style: TextStyle(color: Colors.white)),
        ),
      ], // Correctly set items as a list of DropdownMenuItem
    );
  }
}