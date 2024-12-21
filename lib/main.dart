import 'package:flutter/material.dart';
import 'package:sw_project/customerSupport.dart';
import 'package:sw_project/shoppingCart.dart';
import 'Start/Login.dart'; // Ensure Login.dart is properly imported
import 'Start/Register.dart'; // Ensure Register.dart is properly imported
import 'MainScreen.dart'; // Ensure MainScreen.dart is properly imported
import 'UserProfile.dart'; // Ensure UserProfile.dart is properly imported

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Login.routeName, // Initial route should match Login's routeName
      routes: {
        UserProfile.routeName :(context) => UserProfile(),
        ShoppingCart.routeName : (context) => ShoppingCart(),
        CustomerSupport.routeName: (context)=> CustomerSupport(),
        Login.routeName: (context) => Login(),
        Register.routeName: (context) => Register(),
        Mainscreen.routeName: (context) => Mainscreen(),



      },
    );
  }
}
