import 'package:flutter/material.dart';
import 'package:vishnu/authentication/auth_gate.dart';



class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Delay for 3 seconds
    Future.delayed(const Duration(seconds: 1), () {
      // Navigate to the home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthGate(),
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
         const SizedBox(height: 200),
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
