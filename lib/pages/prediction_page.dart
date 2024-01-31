import 'package:flutter/material.dart';
import 'package:vishnu/components/dropdown_menu.dart';

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CustomDropdownButton(
                          label: "Commodity",
                          options: const [
                            'Commodity1',
                            'Commodity2',
                            'Commodity3'
                          ],
                          selectedValue: selectedCommodity,
                          onChanged: (String? value) {
                            setState(() {
                              selectedCommodity = value;
                            });
                          }),
                      CustomDropdownButton(
                          label: "State",
                          options: const ['State1', 'State2', 'State3'],
                          selectedValue: selectedState,
                          onChanged: (String? value) {
                            setState(() {
                              selectedState = value;
                            });
                          }),
                      CustomDropdownButton(
                          label: "District",
                          options: const [
                            'District1',
                            'District2',
                            'District3'
                          ],
                          selectedValue: selectedDistrict,
                          onChanged: (String? value) {
                            setState(() {
                              selectedDistrict = value;
                            });
                          }),
                      CustomDropdownButton(
                          label: "Market",
                          options: const ['Market1', 'Market2', 'Market3'],
                          selectedValue: selectedMarket,
                          onChanged: (String? value) {
                            setState(() {
                              selectedMarket = value;
                            });
                          }),
                    ],
                  ),
                  const SizedBox(height: 20.0),
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
