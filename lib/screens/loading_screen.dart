import 'package:flutter/material.dart';

import 'package:loading_indicator/loading_indicator.dart';
import '../models/colors.dart';
import './home_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/images/main_icon.png'),
          Text(
            "Keep Notes",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 80,
            width: 80,
            child: LoadingIndicator(
              indicatorType: Indicator.lineScale,
              strokeWidth: 2,
              colors: [Colors.white],
            ),
          ),
        ]),
      ),
    );
  }
}
