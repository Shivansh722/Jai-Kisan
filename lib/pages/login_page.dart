import 'package:flutter/material.dart';
import 'package:vishnu/components/my_button.dart';
import 'package:vishnu/components/textfield.dart';
import 'package:vishnu/authentication/auth_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final void Function()? onTap;

  LoginPage({Key? key, required this.onTap});

  void login(BuildContext context) async {
    // Implement login functionality here
    // get our auth service
    final authService = AuthService();

    // try to login
    try {
      await authService.signInWithEmailAndPassword(
        _emailController.text,
        _pwController.text,
      );
    }

    // catch any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
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
            "Welcome Back",
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

          // Login button
          MyButton(
            text: "Login now!",
            onTap: () => login(context),
          ),

          SizedBox(height: 10),

          // Register button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  " Register now!",
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
