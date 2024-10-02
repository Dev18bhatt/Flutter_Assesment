import 'package:assesment/views/login.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool isChecked = false; // This tracks whether the checkbox is checked
  bool _obscureText = true; // Tracks password visibility

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.09),
              Text(
                "Create Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              _buildTextField(
                label: 'Full Name',
                icon: Icons.person,
                isRequired: true,
              ),
              SizedBox(height: size.height * 0.02),
              _buildTextField(
                label: 'Email or Phone Number',
                icon: Icons.email,
                hintText: 'Enter your email',
                isRequired: true,
              ),
              SizedBox(height: size.height * 0.02),
              _buildPasswordField(
                label: 'Create Password',
                isRequired: true,
              ),
              SizedBox(height: size.height * 0.02),
              _buildPasswordField(
                label: 'Confirm Password',
                isRequired: true,
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      "I agree to terms and Conditions",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (isChecked) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateLoginPage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text('Please agree to the terms and conditions'),
                      ));
                    }
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.3, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'You Can Connect With',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.facebook, size: 40, color: Colors.blue),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 24,
                    child: Image.network(
                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                    ),
                  ),
                  Icon(Icons.apple, size: 40, color: Colors.black),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Center(
                child: Text(
                  "Already have an account? Login",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build a regular text field
  Widget _buildTextField({
    required String label,
    required IconData icon,
    String hintText = '',
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: label,
            style: TextStyle(fontSize: 16),
            children: [
              if (isRequired)
                TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.grey.shade300),
              border: InputBorder.none,
              hintText: hintText,
              contentPadding: EdgeInsets.symmetric(vertical: 12.0),
            ),
          ),
        ),
      ],
    );
  }

  // Method to build a password field
  Widget _buildPasswordField({
    required String label,
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: label,
            style: TextStyle(fontSize: 16),
            children: [
              if (isRequired)
                TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey),
          ),
          child: TextFormField(
            obscureText: _obscureText,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock, color: Colors.grey.shade300),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey.shade300,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              border: InputBorder.none,
              hintText: 'Enter your password',
              contentPadding: EdgeInsets.symmetric(vertical: 12.0),
            ),
          ),
        ),
      ],
    );
  }
}
