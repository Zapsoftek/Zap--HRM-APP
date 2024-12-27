import 'package:flutter/material.dart';
import 'package:zaphrm/src/constant/colors.dart';

class ClientManagement extends StatefulWidget {
  const ClientManagement({super.key});

  @override
  _ClientManagementState createState() => _ClientManagementState();
}

class _ClientManagementState extends State<ClientManagement> {
  final List<Map<String, String>> clients = [
    {'name': 'John Doe', 'email': 'john.doe@example.com', 'phone': '123-456-7890'},
    {'name': 'Jane Smith', 'email': 'jane.smith@example.com', 'phone': '987-654-3210'},
    {'name': 'Alice Johnson', 'email': 'alice.johnson@example.com', 'phone': '456-789-1234'},
  ];

  void _addClient(String name, String email, String phone) {
    setState(() {
      clients.add({'name': name, 'email': email, 'phone': phone});
    });
  }

  void _deleteClient(int index) {
    setState(() {
      clients.removeAt(index);
    });
  }

  void _editClient(int index, String name, String email, String phone) {
    setState(() {
      clients[index] = {'name': name, 'email': email, 'phone': phone};
    });
  }

  void _showClientForm({int? index}) {
    final nameController = TextEditingController(
        text: index != null ? clients[index]['name'] : '');
    final emailController = TextEditingController(
        text: index != null ? clients[index]['email'] : '');
    final phoneController = TextEditingController(
        text: index != null ? clients[index]['phone'] : '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(index == null ? 'Add Client' : 'Edit Client'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                final email = emailController.text.trim();
                final phone = phoneController.text.trim();
                if (name.isNotEmpty && email.isNotEmpty && phone.isNotEmpty) {
                  if (index == null) {
                    _addClient(name, email, phone);
                  } else {
                    _editClient(index, name, email, phone);
                  }
                  Navigator.pop(context);
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteClient(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text('Delete Client',style: TextStyle(color: AppColors.textPrimary),),
          content: Text(
            'Are you sure you want to delete ${clients[index]['name']}?',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel',style:TextStyle(color: AppColors.textPrimary)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                _deleteClient(index);
                Navigator.pop(context);
              },
              child: Text('Delete',style:TextStyle(color: AppColors.backgroundColor) ,),
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
        backgroundColor:AppColors.primaryColor,
        title: Text(
          'Client Management',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: clients.length,
          itemBuilder: (context, index) {
            final client = clients[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.person, color: Colors.black),
                ),
                title: Text(
                  client['name']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  '${client['email']}\n${client['phone']}',
                  style: TextStyle(fontSize: 14),
                ),
                isThreeLine: true,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: AppColors.textPrimary),
                      onPressed: () => _showClientForm(index: index),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _confirmDeleteClient(index),
                    ),
                  ],
                ),
                onTap: () {
                  // Navigate to detailed client screen if needed
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.textPrimary,
        tooltip: 'Add New Client',
        onPressed: () => _showClientForm(),
        child: Icon(Icons.add,color: AppColors.backgroundColor,),
      ),
    );
  }
}
