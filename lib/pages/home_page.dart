import 'package:flutter/material.dart';
import 'package:vishnu/components/my_drawer.dart';
import 'package:vishnu/components/live_bar.dart'; // Replace with the actual path to your LiveRunningBar widget

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grow Green'),
        centerTitle: true,
        backgroundColor: Colors.green.shade300,
        foregroundColor: Colors.white,
      ),
      drawer: MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Your other widgets
          
          Container(
            height: 30, // Adjust the height as needed
            color: Colors.green.shade300,
            child: LiveRunningBar(price: 3999,), // Replace with the actual instantiation of your LiveRunningBar
          ),
        ],
      ),
    );
  }
}
