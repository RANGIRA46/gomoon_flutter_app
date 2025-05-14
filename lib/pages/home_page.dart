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
          _astroImageWidget(deviceHeight, deviceWidth), // Background image
          _gradientOverlay(deviceHeight, deviceWidth), // Gradient overlay
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _pageTitle(), // Title at the top
                _formSection(deviceWidth), // Form section for dropdowns
                _bookRideWidget(deviceHeight, deviceWidth), // Book ride section
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Widget for the page title
  Widget _pageTitle() {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        "#GoMoon",
        style: TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
    );
  }

  /// Widget for the astronaut background image
  Widget _astroImageWidget(double deviceHeight, double deviceWidth) {
    return Container(
      height: deviceHeight,
      width: deviceWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home_background.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// Widget for the gradient overlay
  Widget _gradientOverlay(double deviceHeight, double deviceWidth) {
    return Container(
      height: deviceHeight,
      width: deviceWidth,
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
    );
  }

  /// Form section for the dropdowns
  Widget _formSection(double deviceWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _stationDropdown(deviceWidth), // Station dropdown
          const SizedBox(height: 20),
          _travellerDropdown(deviceWidth), // Traveler and class dropdowns
        ],
      ),
    );
  }

  /// Dropdown for station selection
  Widget _stationDropdown(double deviceWidth) {
    return CustomDropdownButton(
      values: const ['Johnson Webb Station', 'Baraka Station'], // Station options
      width: deviceWidth * 0.9, // 90% of screen width
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
      children: [
        CustomDropdownButton(
          values: const ['1', '2', '3', '4'], // Number of travelers
          width: deviceWidth * 0.42, // 42% of screen width
          placeholder: selectedSeats ?? "Select Seats",
          onChanged: (value) {
            setState(() {
              selectedSeats = value;
            });
          },
        ),
        CustomDropdownButton(
          values: const ['Economy', 'Business', 'First', 'Private'], // Travel class
          width: deviceWidth * 0.42, // 42% of screen width
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
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: deviceHeight * 0.1,
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
                print(
                    "Station: $selectedStation, Seats: $selectedSeats, Class: $selectedClass");
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
        ),
      ),
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