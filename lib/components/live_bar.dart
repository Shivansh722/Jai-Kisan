import 'package:flutter/material.dart';

class LiveRunningBar extends StatelessWidget {
  final double price;

  const LiveRunningBar({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPriceHigh = price > 50.0;

    return Container(
      color: isPriceHigh ? Colors.red : Colors.green,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              '\$$price', // Use whatever format you need for your price
              style: TextStyle(
                color: isPriceHigh ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: (price * 2).toInt(),
            child: Container(
              color: Colors.white,
            ),
          ),
          Container(
            width: 10,
            color: isPriceHigh ? Colors.red : Colors.green,
          ),
        ],
      ),
    );
  }
}
