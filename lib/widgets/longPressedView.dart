import 'package:flutter/material.dart';

class LongPressed extends StatefulWidget {
  const LongPressed({super.key});

  @override
  State<LongPressed> createState() => _LongPressedState();
}

class _LongPressedState extends State<LongPressed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.edit),
          Icon(Icons.pin),
          Icon(Icons.archive_outlined),
          Icon(Icons.delete_forever),
        ],
      ),
    );
  }
}
