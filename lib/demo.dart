import 'package:digitalwebber/view/util/const.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  const Demo({super.key, required this.title, required this.color});
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: customText(title),
      ),
    );
  }
}
