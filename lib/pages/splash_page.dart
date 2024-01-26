import 'package:flutter/material.dart';
import 'package:vishnu/pages/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Delay for 3 seconds
    Future.delayed(const Duration(seconds: 5), () {
      // Navigate to the home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });

    // Placeholder widget for the splash screen UI
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/splash2.jpg',
              width: 300,
              height: 250,
            ),
          SizedBox(height: 200),
            const Align(
            alignment: Alignment.bottomCenter,
           
            child: Text(
              'powered by Grow Green',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 46, 107, 42),
              ),
            ),
          )
          ],
          
        
        ),

      ),
    );
  }
}
