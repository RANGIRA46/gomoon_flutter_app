import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final double _deviceHeight, _deviceWidth;
  String? _selectedDestination; // State variable for the dropdown

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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.grey[800], // Background color for the dropdown
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
        border: Border.all(
          color: Colors.white, // Border color
          width: 1.0, // Border width
        ),
      ),
      child: DropdownButton<String>(
        value: _selectedDestination,
        hint: const Text(
          'Select Destination',
          style: TextStyle(color: Colors.white),
        ),
        dropdownColor: Colors.black,
        isExpanded: true, // Ensures the dropdown takes full width
        underline: Container(), // Removes default underline
        onChanged: (String? newValue) {
          setState(() {
            _selectedDestination = newValue;
          });
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
        ],
      ),
    );
  }
}