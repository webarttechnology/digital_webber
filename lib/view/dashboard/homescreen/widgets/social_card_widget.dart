import 'package:digitalwebber/view/util/const.dart';
import 'package:flutter/material.dart';

class SocialCardWidget extends StatelessWidget {
  const SocialCardWidget(
      {super.key,
      required this.size,
      required this.imageName,
      required this.title,
      required this.subtitle,
      required this.color,
      required this.onTap});

  final Size size;
  final dynamic imageName, title, subtitle;
  final dynamic color;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        margin: const EdgeInsets.only(
          left: 18,
          right: 18,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: color.withOpacity(.2),
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10,
                  color: Color.fromARGB(255, 219, 216, 216),
                  blurStyle: BlurStyle.outer),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  imageName,
                  // color: Colors.white70,
                  opacity: const AlwaysStoppedAnimation(.2),
                  height: 100,
                  width: 100,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
            Container(
                width: size.width,
                height: 55,
                margin: const EdgeInsets.only(top: 18),
                decoration: BoxDecoration(
                    color: color.withOpacity(.8),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(22),
                        bottomRight: Radius.circular(22))),
                child: Center(
                  child: customText(title, textAlign: TextAlign.center),
                ))
          ],
        ),
      ),
    );
  }
}
