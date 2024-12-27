import 'package:flutter/material.dart';
import 'package:zaphrm/src/constant/colors.dart';
import 'employeeList.dart';
import 'employeeform.dart';

class EmployeeDashboard extends StatefulWidget {
  const EmployeeDashboard({super.key});

  @override
  _EmployeeDashboardState createState() => _EmployeeDashboardState();
}

class _EmployeeDashboardState extends State<EmployeeDashboard> {
  // List of employees (for demonstration purposes)
  List<Map<String, String>> allEmployees = [
    {'name': 'John Doe', 'status': 'active'},
    {'name': 'Jane Smith', 'status': 'inactive'},
    {'name': 'Alice Johnson', 'status': 'active'},
    {'name': 'Bob Brown', 'status': 'inactive'},
    // Add more employees here...
  ];

  // Filtered employee list (initialized with all employees)
  late List<Map<String, String>> filteredEmployees;

  // Controller for search bar
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredEmployees = List.from(allEmployees); // Initialize filtered list
  }

  // Function to filter employees by name
  void filterEmployees(String query) {
    setState(() {
      filteredEmployees = allEmployees
          .where((employee) =>
              employee['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Employee Management'),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterEmployees, // Update list based on search
              decoration: InputDecoration(
                labelText: 'Search Employees',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          // Tabs for Active and Inactive Employees
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'Active'),
                      Tab(text: 'Inactive'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Display active employees
                        EmployeeList(
                          employees: filteredEmployees
                              .where((e) => e['status'] == 'active')
                              .toList(),
                          isActive: true,
                        ),
                        // Display inactive employees
                        EmployeeList(
                          employees: filteredEmployees
                              .where((e) => e['status'] == 'inactive')
                              .toList(),
                          isActive: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Employee Screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EmployeeForm()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
