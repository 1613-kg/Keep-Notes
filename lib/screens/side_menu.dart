import 'package:flutter/material.dart';

import '/models/colors.dart';
import '/widgets/archives.dart';
import '/widgets/deleted.dart';
import '/widgets/notes.dart';
import '/widgets/settings.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      child: Container(
        decoration: BoxDecoration(color: bgColor),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    "Google Keep",
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  )),
              Divider(
                color: white.withOpacity(0.3),
              ),
              Notes(),
              SizedBox(
                height: 5,
              ),
              Archives(),
              SizedBox(
                height: 5,
              ),
              Deleted(),
              SizedBox(
                height: 5,
              ),
              Settings(),
            ],
          ),
        ),
      ),
    );
  }
}
