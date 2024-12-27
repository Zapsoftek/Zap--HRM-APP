import 'package:flutter/material.dart';
import 'package:zaphrm/src/constant/colors.dart';

import 'enternewpassword.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Image.asset('assets/Forgot.png'),
              Text(
                'Enter your email address to reset your password.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 40),
              // Email field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 30),
              // Submit button
              SizedBox(
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const EnterNewPasswordPage(),
    ));
                  },
                  child: Container(
                    width: 337,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.errorColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(' reset your password',style: TextStyle(color: AppColors.backgroundColor),),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              // Navigate to login page
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Go back to LoginPage
                },
                child: Text(
                  'Back to Login',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ForgotPasswordPage(),
  ));
}
