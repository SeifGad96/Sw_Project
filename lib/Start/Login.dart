import 'package:flutter/material.dart';
import '../templates/CustomButton.dart';
import 'Register.dart';

class Login extends StatefulWidget {
  static String routeName = "/Login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isPasswordObscure = true;
  String? email;
  String? pass;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFBA68C8), // Light purple color
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFBA68C8), // Light purple color
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(hintText: "Email"),
              onChanged: (data) {
                email = data;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is required";
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return "Enter a valid email";
                }
                return null;
              },
            ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordObscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordObscure = !_isPasswordObscure;
                        });
                      },
                    ),
                  ),
                  obscureText: _isPasswordObscure, // To hide the password text
                  onChanged: (data) {
                    pass = data;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    // Optional: Add password strength validation (e.g., minimum length, mix of characters)
                    if (value.length < 6) {
                      return "Password must be at least 6 characters long";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),
                if (isLoading)
                  const CircularProgressIndicator()
                else
                  CustomButton(
                    onTap: () async {
                       {
                        setState(() {
                          isLoading = true;
                        });


                        if (email == "momenramadan682@gmail.com" && pass == "password") {
                          showSnackBar(context, 'Login Successful');
                          Navigator.pushReplacementNamed(
                              context, "/Mainscreen");
                        } else {
                          showSnackBar(context, 'Invalid email or password');
                        }

                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    buttonText: "Sign In",
                  ),
                Row(
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Register.routeName);
                      },
                      child: const Text(
                        "REGISTER",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFBA68C8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
      ),
    );
  }
}
