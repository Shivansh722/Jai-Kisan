import 'package:flutter/material.dart';
import 'package:vishnu/components/my_drawer.dart';
import 'package:vishnu/authentication/auth_service.dart';
import 'package:vishnu/components/live_bar.dart'; // Replace with the actual path to your LiveRunningBar widget

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  //logout function
  void logout() {
    //implement logout here
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grow Green'),
        actions: [
          //logout button
          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
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
            child: LiveRunningBar(price: 60,), // Replace with the actual instantiation of your LiveRunningBar
          ),
        ],
      ),
    );
  }

  
}
