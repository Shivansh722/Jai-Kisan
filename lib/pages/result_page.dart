// results_page.dart

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  final String? selectedCommodity;
  final String? selectedState;
  final String? selectedDistrict;
  final String? selectedMarket;

  const ResultPage({
    super.key,
    required this.selectedCommodity,
    required this.selectedState,
    required this.selectedDistrict,
    required this.selectedMarket
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Values:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              selectedCommodity ?? 'No Commodity Selected',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
