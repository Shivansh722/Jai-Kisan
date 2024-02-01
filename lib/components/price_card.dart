import 'package:flutter/material.dart';

class PriceCard extends StatelessWidget {
  final String minPrice;
  final String modelPrice;
  final String maxPrice;

  const PriceCard({
    super.key,
    required this.minPrice,
    required this.modelPrice,
    required this.maxPrice,
  });

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
              'Price Details',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(height: 20.0, color: Colors.black),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: IntrinsicColumnWidth(),
                1: IntrinsicColumnWidth(),
                2: IntrinsicColumnWidth(),
              },
              children: [
                buildTableRow('Min. Price: ', minPrice),
                buildTableRow('Model Price: ', modelPrice),
                buildTableRow('Max. Price: ', maxPrice),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TableRow buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: TableCell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 45.0),
            Expanded(
              flex: 1,
              child: TableCell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
