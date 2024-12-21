import 'package:flutter/material.dart';


import '../templates/CustomButton.dart';
import '../templates/CustomTextField.dart';
import 'Login.dart';

class Register extends StatefulWidget {

  static String routeName = "/Register";


  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? email; //
  String? pass; //
  GlobalKey<FormState> formkey1 = GlobalKey<FormState>();
  bool isLoading = false;
  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formkey1,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Sign Up!',
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFBA68C8), // Light purple color
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    hintText: "User Name",
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    hintText: "Email",
                    onChanged: (data) {
                      email = data;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    hintText: "Password",
                    isPasswordField: true,
                    isObscure: _isPasswordObscure,
                    onSuffixIconTap: () {
                      setState(() {
                        _isPasswordObscure = !_isPasswordObscure;
                      });
                    },
                    onChanged: (data) {
                      pass = data;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    hintText: "Confirm Password",
                    isPasswordField: true,
                    isObscure: _isConfirmPasswordObscure,
                    onSuffixIconTap: () {
                      setState(() {
                        _isConfirmPasswordObscure = !_isConfirmPasswordObscure;
                      });
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomButton(
                    onTap: () {
                      if (formkey1.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });

                        // Simulating a successful operation
                        Future.delayed(const Duration(seconds: 2), () {
                          setState(() {
                            isLoading = false;
                          });
                          showSnackBar(context, 'Operation Success');
                          Navigator.pushReplacementNamed(context, Login.routeName);
                        });
                      }
                    },
                    buttonText: "Sign UP",
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
