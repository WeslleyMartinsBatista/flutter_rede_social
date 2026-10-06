import 'package:flutter/material.dart';
import 'view/LoginView.dart'; 

void main() {
  runApp(const Flutter_Web_Mobile());
}

class Flutter_Web_Mobile extends StatelessWidget {
  const Flutter_Web_Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: loginView(), 
    );
  }
}
