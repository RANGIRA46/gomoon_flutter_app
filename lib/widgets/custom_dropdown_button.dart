import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<String> values; // List of dropdown items
  final double width; // Width of the dropdown

  const CustomDropdownButton({
    required this.values,
    required this.width,
    super.key,
  });

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? _selectedValue; // State variable for selected value

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width, // Set the width of the dropdown
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
        value: _selectedValue,
        hint: const Text(
          'Select an option',
          style: TextStyle(color: Colors.white),
        ),
        dropdownColor: Colors.black,
        isExpanded: true, // Ensures dropdown takes full width
        underline: Container(), // Removes default underline
        onChanged: (String? newValue) {
          setState(() {
            _selectedValue = newValue; // Update selected value
          });
        },
        items: widget.values.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(color: Colors.white),
            ),
          );
        }).toList(),
      ),
    );
  }
}