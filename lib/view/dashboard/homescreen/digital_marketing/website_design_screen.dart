import 'package:digitalwebber/view/util/const.dart';
import 'package:flutter/material.dart';

class DigitalMarketingScreen extends StatelessWidget {
  const DigitalMarketingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimary,
        body: Center(
          child: customHeading('Digital Marketing'),
        ));
  }
}
