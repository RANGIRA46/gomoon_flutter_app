import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // State variables to hold the selected values
  String? selectedStation;
  String? selectedSeats;
  String? selectedClass;

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
                  _stationDropdown(deviceWidth), // Station dropdown
                  _travellerDropdown(deviceWidth), // Dropdown for number of travelers and class
                  _bookRideWidget(deviceHeight, deviceWidth), // Book ride widget
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

  /// Dropdown for station selection
  Widget _stationDropdown(double deviceWidth) {
    return CustomDropdownButton(
      values: const ['Johnson Webb Station', 'Baraka Station'], // Station options
      width: deviceWidth * 0.8, // 80% of screen width
      placeholder: selectedStation ?? "Select a Station",
      onChanged: (value) {
        setState(() {
          selectedStation = value;
        });
      },
    );
  }

  /// Dropdowns for number of travelers and travel class
  Widget _travellerDropdown(double deviceWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomDropdownButton(
          values: const ['1', '2', '3', '4'], // Number of travelers
          width: deviceWidth * 0.45, // 45% of screen width
          placeholder: selectedSeats ?? "Select Seats",
          onChanged: (value) {
            setState(() {
              selectedSeats = value;
            });
          },
        ),
        CustomDropdownButton(
          values: const ['Economy', 'Business', 'First', 'Private'], // Travel class
          width: deviceWidth * 0.40, // 40% of screen width
          placeholder: selectedClass ?? "Select Class",
          onChanged: (value) {
            setState(() {
              selectedClass = value;
            });
          },
        ),
      ],
    );
  }

  /// Widget for the book ride section
  Widget _bookRideWidget(double deviceHeight, double deviceWidth) {
    return Container(
      height: deviceHeight * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Book Your Ride Now!",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          _rideButton(deviceHeight, deviceWidth),
        ],
      ),
    );
  }

  /// Ride Button Widget
  Widget _rideButton(double deviceHeight, double deviceWidth) {
    return Container(
      padding: EdgeInsets.only(bottom: deviceHeight * 0.01),
      width: deviceWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: () {
          // Add your booking logic here
          if (selectedStation != null &&
              selectedSeats != null &&
              selectedClass != null) {
            // Show confirmation or proceed
            print("Station: $selectedStation, Seats: $selectedSeats, Class: $selectedClass");
          } else {
            // Show error or prompt user to select all options
            print("Please select all required options.");
          }
        },
        child: const Text(
          "Book Ride!",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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

/// Updated `CustomDropdownButton` widget
class CustomDropdownButton extends StatelessWidget {
  final List<String> values;
  final double width;
  final String placeholder;
  final Function(String?) onChanged;

  const CustomDropdownButton({
    super.key,
    required this.values,
    required this.width,
    required this.placeholder,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<String>(
        value: values.contains(placeholder) ? placeholder : null,
        hint: Text(placeholder),
        items: values.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
        isExpanded: true,
        underline: Container(), // Remove underline
      ),
    );
  }
}