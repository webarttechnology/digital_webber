import 'package:digitalwebber/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRichTextWidget extends StatelessWidget {
  const CustomRichTextWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      this.color,
      this.fontWeight,
      this.subColor});
  final String title;
  final String subtitle;
  final Color? color;
  final Color? subColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      text: title,
      children: [
        TextSpan(
            text: subtitle,
            style: TextStyle(
                fontWeight: fwNormal, height: 1.4.h, color: subColor)),
      ],
      style: TextStyle(
          color: color ?? kBlack87, fontWeight: fontWeight ?? FontWeight.bold),
    ));
  }
}
