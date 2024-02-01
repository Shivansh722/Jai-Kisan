import 'package:flutter/material.dart';
import 'package:vishnu/pages/login_page.dart';
import 'package:vishnu/pages/settings_page.dart';
import 'package:vishnu/pages/prediction_page.dart';
import 'package:vishnu/authentication/auth_service.dart';

class MyDrawer extends StatelessWidget {

  void logout(BuildContext context) {
    final _auth = AuthService();
    _auth.signOut();
    // After logging out, you may want to navigate to the login or home screen
    // Example:
     // Replace '/login' with your login screen route
  }

  const MyDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          const DrawerHeader(
            child: Center(
              child: Icon(
                Icons.person,
                size: 60,
              ),
              // Your user profile content goes here
            ),
          ),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('H O M E'),
              leading: Icon(Icons.home),
              onTap: () => Navigator.pop(context),
            ),
          ),

          ListTile(
            title: const Text('P R E D I C T I O N'),
            leading: Icon(Icons.batch_prediction),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PredictionPage(),
                ),
              );
            },
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text('S E T T I N G S'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              onTap: () {
                Navigator.pop(context);
                logout(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
