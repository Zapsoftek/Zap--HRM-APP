import 'package:flutter/material.dart';

import 'employeedetailsscreen.dart';


class EmployeeList extends StatelessWidget {
  final bool isActive;

  const EmployeeList({super.key, required this.isActive, required List<Map<String, String>> employees});

  @override
  Widget build(BuildContext context) {
    // Example list of employees
    final employees = [
      {'name': 'John Doe', 'status': 'active'},
      {'name': 'Jane Smith', 'status': 'inactive'},
    ].where((e) => e['status'] == (isActive ? 'active' : 'inactive')).toList();

    return ListView.builder(
      itemCount: employees.length,
      itemBuilder: (context, index) {
        final employee = employees[index];

        // Determine color based on employee status
        Color cardColor = employee['status'] == 'active'
            ? Colors.green[200]! // Light green for active
            : Colors.red[200]!; // Light red for inactive

        return Card(
          color: cardColor, // Apply color based on status
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            leading: CircleAvatar(
              child: Text(employee['name']![0]), // Display first letter of name
            ),
            title: Text(employee['name']!),
            subtitle:
                Text(employee['status']!), // Display status under the name
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to Employee Details
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EmployeeDetails(employeeName: employee['name']!),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
