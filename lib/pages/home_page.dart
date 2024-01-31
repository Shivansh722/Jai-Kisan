import 'package:flutter/material.dart';
import 'package:vishnu/components/homePage_card.dart';
import 'package:vishnu/components/my_drawer.dart';
import 'package:vishnu/authentication/auth_service.dart';
import 'package:vishnu/components/live_bar.dart'; // Replace with the actual path to your LiveRunningBar widget
import 'package:vishnu/pages/result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String option1 = "Option 1";
  String option2 = "Option 2";
  String option3 = "Option 3";
  String option4 = "Option 4";
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
            child: const LiveRunningBar(price: 60,), // Replace with the actual instantiation of your LiveRunningBar
          ),
          Center(
            child: CardWidget(
              onGetResults: (selectedValues) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(selectedValues: selectedValues),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
