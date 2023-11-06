import 'package:digitalwebber/view/util/const.dart';
import 'package:flutter/material.dart';

class WebsiteDesignScreen extends StatelessWidget {
  const WebsiteDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimary,
        body: Center(
          child: customHeading('Website Heading'),
        ));
  }
}
