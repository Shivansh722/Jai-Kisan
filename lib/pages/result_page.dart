// results_page.dart

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  const ResultPage({super.key, required this.selectedValues});
  final List<String> selectedValues;


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
            for (String value in selectedValues)
              Text(
                value,
                style: TextStyle(fontSize: 16.0),
              ),
          ],
        ),
      ),
    );
  }
}
