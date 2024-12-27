import 'package:flutter/material.dart';
import 'package:zaphrm/src/constant/colors.dart';

import 'attendance_reports_screen.dart';
import 'employee_details_screen.dart';
import 'feature_tile.dart';
import 'generate_payslips_screen.dart';
import 'manager_details_screen.dart';


class PayrollScreen extends StatelessWidget {
  const PayrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payroll Management'),
      backgroundColor: AppColors.primaryColor,
      ),
      body: ListView(
        children: [
          FeatureTile(
            icon: Icons.person,
            title: 'View Employee Payroll Details',
            subtitle: 'Access payroll information for employees',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => EmployeeDetailsScreen()),
              );
            },
          ),
          FeatureTile(
            icon: Icons.supervisor_account,
            title: 'View Manager Payroll Details',
            subtitle: 'Access payroll information for managers',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ManagerDetailsScreen()),
              );
            },
          ),
          FeatureTile(
            icon: Icons.receipt,
            title: 'Generate Payslips',
            subtitle: 'Create payslips for employees',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => GeneratePayslipsScreen()),
              );
            },
          ),
          FeatureTile(
            icon: Icons.pie_chart,
            title: 'Generate Attendance Reports',
            subtitle: 'View attendance reports for all users',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AttendanceReportsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
