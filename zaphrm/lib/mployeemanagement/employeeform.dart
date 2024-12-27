import 'package:flutter/material.dart';
import 'package:zaphrm/src/constant/colors.dart';

class EmployeeForm extends StatelessWidget {
  final String? name;
  final String? aadhaar;
  final String? pan;

  const EmployeeForm({super.key, this.name, this.aadhaar, this.pan});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: name);
    final TextEditingController aadhaarController =
        TextEditingController(text: aadhaar);
    final TextEditingController panController =
        TextEditingController(text: pan);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Text(name == null ? 'Add Employee' : 'Update Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: aadhaarController,
              decoration: InputDecoration(labelText: 'Aadhaar Number'),
            ),
            TextField(
              controller: panController,
              decoration: InputDecoration(labelText: 'PAN Card Number'),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 10, horizontal: 20), // Add margin for spacing
              padding:
                  EdgeInsets.symmetric(vertical: 15), // Add padding for height
              decoration: BoxDecoration(
                color: AppColors.textPrimary, // Background color
                borderRadius: BorderRadius.circular(8), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26, // Shadow color
                    blurRadius: 4, // Shadow blur
                    offset: Offset(2, 2), // Shadow position
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  // Save or update logic
                },
                child: Center(
                  child: Text(
                    name == null ? 'Add Employee' : 'Update Employee',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontWeight: FontWeight.bold, // Bold text
                      fontSize: 16, // Font size
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
