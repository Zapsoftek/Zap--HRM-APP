import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/logo.png'), // Replace with your asset
          ),
          const SizedBox(height: 10),
          const Text(
            'User Name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'user@example.com',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

// Drawer Menu Item Widget
class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String onTapAction;

  const DrawerMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTapAction,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        Navigator.pushNamed(context, onTapAction); // Navigate to the action
      },
    );
  }
}