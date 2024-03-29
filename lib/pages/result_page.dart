// results_page.dart

import 'package:flutter/material.dart';
import 'package:vishnu/components/price_card.dart';

class ResultPage extends StatelessWidget {
  final String? selectedCommodity;
  final String? selectedState;
  final String? selectedDistrict;
  final String? selectedMarket;

  const ResultPage(
      {super.key,
      required this.selectedCommodity,
      required this.selectedState,
      required this.selectedDistrict,
      required this.selectedMarket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
        centerTitle: true,
        backgroundColor: Colors.green.shade300,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(25, 40, 16, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Market: ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10.0),
                Text(
                  selectedMarket ?? 'No Market Selected',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                const Text(
                  'Commodity: ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10.0),
                Text(
                  selectedCommodity ?? 'No Commodity Selected',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Center(
              child: PriceCard(),
            ),
          ],
        ),
      ),
    );
  }
}
