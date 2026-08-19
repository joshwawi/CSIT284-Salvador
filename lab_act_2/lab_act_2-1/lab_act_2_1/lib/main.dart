import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient:LinearGradient(colors: [
            Colors.red, 
            Colors.yellow
          ])
        ), 
      child: Center(
        child: Text("Hello Wawii"),
        ),
      ),
    ),
  ),
  ); 
}