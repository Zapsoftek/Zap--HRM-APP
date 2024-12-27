import 'package:flutter/material.dart';
import 'package:zaphrm/mployeemanagement/employeeform.dart';

class EmployeeDetails extends StatelessWidget {
  final String employeeName;

  const EmployeeDetails({super.key, required this.employeeName});

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Employee'),
          content: Text('Are you sure you want to delete $employeeName?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perform delete operation here
                // For example, call an API or remove from a database
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Navigate back to the previous screen
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$employeeName deleted successfully')),
                );
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(employeeName),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navigate to Update Employee Form
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmployeeForm(name: employeeName)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _showDeleteConfirmation(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $employeeName'),
            Text('Status: Active'),
            // Other details here
          ],
        ),
      ),
    );
  }
}
