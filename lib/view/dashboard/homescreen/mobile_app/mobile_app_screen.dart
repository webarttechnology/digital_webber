import 'package:digitalwebber/view/util/const.dart';
import 'package:flutter/material.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimary,
        body: Center(
          child: customHeading("Mobile Screen"),
        ));
  }
}
