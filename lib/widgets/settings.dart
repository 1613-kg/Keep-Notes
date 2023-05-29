import 'package:flutter/material.dart';

import '../models/colors.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50)),
          ))),
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Icon(
                  Icons.settings_outlined,
                  size: 25,
                  color: white.withOpacity(0.7),
                ),
                SizedBox(
                  width: 27,
                ),
                Text(
                  "Settings",
                  style: TextStyle(color: white.withOpacity(0.7), fontSize: 18),
                )
              ],
            ),
          )),
    );
  }
}
