import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vishnu/pages/settings_page.dart'; // Import the path to SettingPage

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // User profile
          const DrawerHeader(
            child: Center(
              child: Icon(
                Icons.person,
                size: 60,
                
              ),
              // Your user profile content goes here
            ),
          ),

          // Home list tile
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('H O M E'),
              leading: Icon(Icons.home),
              onTap: () => Navigator.pop(context),
              // Add onTap functionality for navigating to home page
            ),
          ),

          // Settings list tile
          ListTile(
            title:const  Text('S E T T I N G S'),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context); // pop the drawer

              // navigate to settings page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
            // Add onTap functionality for navigating to settings page
          ),

          // Logout list tile
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              // Add onTap functionality for logging out
              
             
            ),
          ),
        ],
      ),
    );
  }
}
