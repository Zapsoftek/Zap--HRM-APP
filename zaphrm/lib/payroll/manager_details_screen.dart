import 'package:flutter/material.dart';

class ManagerDetailsScreen extends StatelessWidget {
  const ManagerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manager Payroll Details')),
      body: Center(
        child: Text('Manager payroll details will appear here.'),
      ),
    );
  }
}
