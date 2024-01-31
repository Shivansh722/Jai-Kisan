import 'package:flutter/material.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({Key? key}) : super(key: key);

  @override
  _PredictionPageState createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  // Initialize variables to hold selected values
  String? selectedCommodity;
  String? selectedState;
  String? selectedDistrict;
  String? selectedMarket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prediction'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Commodity Dropdown
                  Text('Commodity:'),
                  DropdownButton<String>(
                    
                    value: selectedCommodity,
                    onChanged: (String? value) {
                      setState(() {
                        selectedCommodity = value;
                      });
                    },
                    items: ['Commodity1', 'Commodity2', 'Commodity3']
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 16.0),

                  // State Dropdown
                  Text('State:'),
                  DropdownButton<String>(
                    value: selectedState,
                    onChanged: (String? value) {
                      setState(() {
                        selectedState = value;
                      });
                    },
                    items: ['State1', 'State2', 'State3']
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 16.0),

                  // District Dropdown
                  Text('District:'),
                  DropdownButton<String>(
                    value: selectedDistrict,
                    onChanged: (String? value) {
                      setState(() {
                        selectedDistrict = value;
                      });
                    },
                    items: ['District1', 'District2', 'District3']
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 16.0),

                  // Market Dropdown
                  Text('Market:'),
                  DropdownButton<String>(
                    value: selectedMarket,
                    onChanged: (String? value) {
                      setState(() {
                        selectedMarket = value;
                      });
                    },
                    items: ['Market1', 'Market2', 'Market3']
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 16.0),

                  // Date picker can be added here

                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle the form submission here
                      // You can access selectedCommodity, selectedState, etc.
                      // and perform the necessary actions
                      // For example, send the selected values to an API
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
