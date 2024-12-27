import 'package:flutter/material.dart';

import '../Client Management/client management.dart';
import '../payroll/payroll.dart';
import 'EmployeeDetails.dart';

class EmployeeManagement extends StatelessWidget {
  EmployeeManagement({super.key});

  // List of asset image paths for each grid item
  final List<String> assets = [
    'assets/employeemanaement.png',
    'assets/client.png',
    'assets/payroll.png',
    'assets/leavepolicies.png',
    'assets/performancereview.png',
    'assets/manager.png',
    'assets/managerflows.png',
    'assets/Leave.png',
    'assets/project.png',
    'assets/py.png',
    // Add more assets as needed
  ];

  // List of text labels to show under each image
  final List<String> labels = [
    'Employeemanaement',
    'Client Management',
    'Payroll',
    'Leave Policies',
    'Performance Review',
    'Manager Management',
    'Manager Flows',
    'Leave Management',
    'Project Management',
    'Payslip',
    // Add more labels as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          // Wrap Column with SingleChildScrollView
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap:
                    true, // Ensure GridView takes only as much space as needed
                physics:
                    NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                ),
                itemCount: assets.length, // Total number of items
                itemBuilder: (context, index) {
                  String imagePath = assets[index]; // Fetch the image path
                  String label = labels[index]; // Fetch the corresponding label

                  return Card(
                    color: Colors.white,
                    child: Column(
                      mainAxisSize:
                          MainAxisSize.min, // Take only necessary space
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center content vertically
                      children: [
                        InkWell(
                          onTap: () {
                            // Check if the tapped image is 'assets/employeemanaement.png'
                            if (imagePath == 'assets/employeemanaement.png') {
                              // Navigate to the new screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EmployeeDashboard(),
                                ),
                              );
                            }

                            if (imagePath == 'assets/client.png') {
                              // Navigate to the new screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ClientManagement(),
                                ),
                              );
                            }

                            if (imagePath == 'assets/payroll.png') {
                              // Navigate to the new screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Payroll(),
                                ),
                              );
                            }
                          },
                          child: Image.asset(
                            imagePath, // Use the dynamic asset path based on the index
                            fit: BoxFit.cover, // Adjust image size
                          ),
                        ),
                        SizedBox(
                            height: 8), // Add spacing between image and text
                        Text(
                          label, // Display text label
                          style: TextStyle(
                            color: Colors.black, // Text color
                            fontSize: 16, // Font size
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Define the new screen to navigate to
