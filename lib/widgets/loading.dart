import 'package:flutter/material.dart';
import 'package:notes/models/colors.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: CircularProgressIndicator(color: white),
      ),
    );
  }
}
