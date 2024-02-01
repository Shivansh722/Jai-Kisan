import 'package:flutter/material.dart';
import 'package:vishnu/components/dropdown_menu.dart';
import 'package:vishnu/pages/result_page.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  String? selectedCommodity;
  String? selectedState;
  String? selectedDistrict;
  String? selectedMarket;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: const Color.fromARGB(255, 0, 68, 2),
      surfaceTintColor: const Color.fromARGB(255, 0, 114, 4),
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
                CustomDropdownButton(
                    label: "Commodity",
                    options: const ['Commodity1', 'Commodity2', 'Commodity3'],
                    selectedValue: selectedCommodity,
                    onChanged: (String? value) {
                      setState(() {
                        selectedCommodity = value;
                      });
                    }),
                CustomDropdownButton(
                    label: "State",
                    options: const [
                      'State1           ',
                      'State2           ',
                      'State3           '
                    ],
                    selectedValue: selectedState,
                    onChanged: (String? value) {
                      setState(() {
                        selectedState = value;
                      });
                    }),
                CustomDropdownButton(
                    label: "District",
                    options: const [
                      'District1        ',
                      'District2        ',
                      'District3        '
                    ],
                    selectedValue: selectedDistrict,
                    onChanged: (String? value) {
                      setState(() {
                        selectedDistrict = value;
                      });
                    }),
                CustomDropdownButton(
                    label: "Market",
                    options: const [
                      'Market1        ',
                      'Market2        ',
                      'Market3        '
                    ],
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                        selectedCommodity: selectedCommodity,
                        selectedState: selectedState,
                        selectedDistrict: selectedDistrict,
                        selectedMarket: selectedMarket),
                  ),
                );
              },
              child: const Text('Get Results'),
            ),
          ],
        ),
      ),
    );
  }
}
