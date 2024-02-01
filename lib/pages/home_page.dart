import 'package:flutter/material.dart';
import 'package:vishnu/authentication/auth_service.dart';
import 'package:vishnu/components/graph.dart';
import 'package:vishnu/components/homepage_card.dart';
import 'package:vishnu/components/live_bar.dart'; // Replace with the actual path to your LiveRunningBar widget
import 'package:vishnu/components/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //logout function
  void logout() {
    //implement logout here
    final auth = AuthService();
    auth.signOut();
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
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30,
              color: Colors.green.shade300,
              child: const LiveRunningBar(
                price: 60,
              ),
            ),
            const Center(
              child: CardWidget(),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.black12,
              width: MediaQuery.of(context).size.width,
              child: const LineChartWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
