import 'package:flutter/material.dart';
import 'package:zaphrm/mployeemanagement/employeemanagement.dart';
import 'package:zaphrm/src/constant/colors.dart';



class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
   int _selectedIndex = 0;


   final List<Widget> _pages = [
    Center(child: EmployeeManagement ()),
    Center(child: Text('Manager Management')),
    Center(child: Text('Client Management')),
    Center(child: Text('Payroll')),
    Center(child: Text('Leave Policies')),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('ZAPHRM'),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Employee',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Manager',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Client',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Payroll',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: 'Leave',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
