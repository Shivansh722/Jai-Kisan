import 'package:flutter/material.dart';
import 'package:vishnu/components/my_button.dart';
import 'package:vishnu/components/textfield.dart';
import 'package:vishnu/authentication/auth_service.dart';


class RegisterPage extends StatelessWidget {
   RegisterPage({super.key, required this.onTap});
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  final void Function()?  onTap;

  void register(BuildContext context) {
    // Implement login functionality here
    //this is a ui function, so we can use setState
    //geting the auth service instance
    final _auth = AuthService();

    //check if the passwords match, then creating the user
    if(_pwController.text == _confirmPwController.text)
    { 
      try {
        _auth.signUpWithEmailAndPassword(_emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        )
      );
      }
    }
    //if the passwords don't match, then don't 
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match"),
        )
      );
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          Image.asset(
            'lib/assets/splash2.jpg',
            width: 300,
            height: 250,
          ),

          // Welcome back message
          const Text(
            "Let's create an account for you!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 46, 107, 42),
            ),
          ),

          // Email textfield
          MyTextField(
            hintText: 'Email',
            obscureText: false,
            controller: _emailController,
          ),

          SizedBox(height: 10),

          // Password textfield
          MyTextField(
            hintText: 'Password',
            obscureText: true,
            controller: _pwController,
          ),

          SizedBox(height: 10),

          // Confirm password textfield
          MyTextField(
            hintText: 'Confirm Password',
            obscureText: true,
            controller: _confirmPwController,
          ),

          // Login button
          MyButton(
            text: "Register now!",
            onTap: () => register(context),
          ),

          SizedBox(height: 10),

          // Register button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              GestureDetector(
                onTap:onTap,
                child: Text(
                  " Login now!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
