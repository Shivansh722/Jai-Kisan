import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key, required this.onGetResults});
  final Function(List<String>) onGetResults;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  // Add variables to store selected values from dropdown menus
  String selectedOption1 = "Option 1A";
  String selectedOption2 = "Option 2A";
  String selectedOption3 = "Option 3A";
  String selectedOption4 = "Option 4A";

  // Define options for each dropdown
  List<String> options1 = ["Option 1A", "Option 1B", "Option 1C"];
  List<String> options2 = ["Option 2A", "Option 2B", "Option 2C"];
  List<String> options3 = ["Option 3A", "Option 3B", "Option 3C"];
  List<String> options4 = ["Option 4A", "Option 4B", "Option 4C"];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Today's Live Price",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(height: 20.0, color: Colors.black),
            const SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDropdown("Commodity", options1, selectedOption1),
                buildDropdown("State", options2, selectedOption2),
                buildDropdown("District", options3, selectedOption3),
                buildDropdown("Market", options4, selectedOption4),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                List<String> selectedValues = [
                  selectedOption1,
                  selectedOption2,
                  selectedOption3,
                  selectedOption4,
                ];

                widget.onGetResults(selectedValues);
              },
              child: const Text('Get Results'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown(
      String label, List<String> options, String selectedValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
        const SizedBox(width: 15.0), // Adjust the spacing as needed
        Expanded(
          flex: 2, // Adjust the flex values based on your preference
          child: DropdownButton<String>(
            value: selectedValue,
            onChanged: (newValue) {
              setState(() {
                switch (label) {
                  case "Option 1":
                    selectedOption1 = newValue!;
                    break;
                  case "Option 2":
                    selectedOption2 = newValue!;
                    break;
                  case "Option 3":
                    selectedOption3 = newValue!;
                    break;
                  case "Option 4":
                    selectedOption4 = newValue!;
                    break;
                }
              });
            },
            items: options
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
