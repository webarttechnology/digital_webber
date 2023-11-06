import 'package:digitalwebber/view/util/const.dart';
import 'package:flutter/material.dart';

class VideoProductionScreen extends StatelessWidget {
  const VideoProductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimary,
        body: Center(
          child: customHeading('Video Productionn Screen'),
        ));
  }
}
