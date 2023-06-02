import 'package:flutter/material.dart';

import 'package:loading_indicator/loading_indicator.dart';
import 'package:notes/screens/login_screen.dart';
import '../models/colors.dart';
import '../providers/login_data.dart';
import './home_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late bool isLogin;
  bool isGridView = true;
  getLoginState() async {
    await LocalDataSaver.getLogData().then((value) {
      setState(() {
        isLogin = value.toString() == "null";
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoginState();
    Future.delayed(Duration(seconds: 2), () {
      (isLogin)
          ? Navigator.pushReplacementNamed(context, HomeScreen.routeName,
              arguments: {
                  "isGridView": isGridView,
                })
          : Navigator.pushReplacementNamed(context, Login.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
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
