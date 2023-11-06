import 'package:flutter/material.dart';

class CustomRichTextWidget extends StatelessWidget {
  const CustomRichTextWidget(
      {super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      text: title,
      children: [
        TextSpan(
            text: subtitle,
            style: const TextStyle(fontWeight: FontWeight.normal, height: 1.4))
      ],
      style: const TextStyle(fontWeight: FontWeight.bold),
    ));
  }
}
