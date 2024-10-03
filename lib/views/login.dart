import 'package:assesment/views/createPost.dart';
import 'package:assesment/views/post.dart';
import 'package:assesment/views/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreateLoginPage extends StatefulWidget {
  @override
  _CreateLoginPageState createState() => _CreateLoginPageState();
}

class _CreateLoginPageState extends State<CreateLoginPage> {
  bool isChecked = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
  

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.02),
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/images/logo.jpeg'),
                    Text(
                      "Welcome Back!",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Let's login to continue exploring",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.1),

              // Email Input
              Padding(
                padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                child: Text.rich(
                  TextSpan(
                    text: 'Email or Phone Number',
                    style: TextStyle(fontSize: 16),
                    children: [
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.grey.shade300),
                    border: InputBorder.none,
                    
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Password Input
              Padding(
                padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                child: Text.rich(
                  TextSpan(
                    text: 'Password',
                    style: TextStyle(fontSize: 16),
                    children: [
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
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
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Forgot Password?"),
                ),
              ),

              // Checkbox and Remember Me
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
                  Text("Remember Me", style: TextStyle(fontSize: 16)),
                ],
              ),

              // Sign In Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (isChecked) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostPage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text('Please agree to the terms and conditions'),
                      ));
                    }
                  },
                  child: Text('Sign In', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.3, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 111, 0),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Divider with text
              Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 1, color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'You Can Connect With',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    child: Divider(thickness: 1, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Social Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook, size: 40, color: Colors.blue),
                  SizedBox(width: 20),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 24,
                    child: Image.network(
                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                    ),
                  ),
                  SizedBox(width: 20),
                  Icon(Icons.apple, size: 40, color: Colors.black),
                ],
              ),
              SizedBox(height: 20),

              // Sign Up
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Do not have an account? ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          Colors.black, // Default color for non-tappable text
                    ),
                    children: [
                      TextSpan(
                        text: "Sign Up Or Register",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange, // Orange color for "Login"
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Add your navigation or any action here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CreateAccountPage(), // Navigate to LoginPage
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
