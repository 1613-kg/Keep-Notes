import 'package:flutter/material.dart';

import '../models/colors.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.blueAccent.withOpacity(0.3)),
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
                  Icons.lightbulb,
                  size: 25,
                  color: Colors.blue.withOpacity(0.7),
                ),
                SizedBox(
                  width: 27,
                ),
                Text(
                  "Notes",
                  style: TextStyle(
                      color: Colors.blue.withOpacity(0.7), fontSize: 18),
                )
              ],
            ),
          )),
    );
  }
}
