import 'package:flutter/material.dart';

// Dummy model for Employee Payroll (you can replace this with a real data model)
class EmployeePayroll {
  final String name;
  final double salary;
  final String paymentDate;

  EmployeePayroll({required this.name, required this.salary, required this.paymentDate});
}

class EmployeeDetailsScreen extends StatelessWidget {
  // Sample data, replace with actual data from backend or database
  final List<EmployeePayroll> employeePayrolls = [
    EmployeePayroll(name: "John Doe", salary: 5000, paymentDate: "2024-12-01"),
    EmployeePayroll(name: "Jane Smith", salary: 4500, paymentDate: "2024-12-05"),
    EmployeePayroll(name: "Alice Johnson", salary: 5500, paymentDate: "2024-12-10"),
  ];

   EmployeeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Payroll Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: employeePayrolls.length,
          itemBuilder: (context, index) {
            final payroll = employeePayrolls[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.account_circle, size: 40, color: Colors.white),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            payroll.name,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Salary: \$${payroll.salary.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Payment Date: ${payroll.paymentDate}',
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.blueAccent),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
