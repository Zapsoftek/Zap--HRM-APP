import 'package:flutter/material.dart';

import 'payroll_screen.dart';


void main() {
  runApp(Payroll());
}

class Payroll extends StatelessWidget {
  const Payroll({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payroll Management',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PayrollScreen(),
    );
  }
}
