import 'package:digitalwebber/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        margin: EdgeInsets.symmetric(horizontal: 18.w),
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
            color: color.withOpacity(.2),
            borderRadius: BorderRadius.circular(22.r),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10.r,
                  color: const Color.fromARGB(255, 219, 216, 216),
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
                  // color: kWhite70,
                  opacity: const AlwaysStoppedAnimation(.2),
                  height: 100.h,
                  width: 100.h,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: kBlack54),
                ),
              ],
            ),
            Container(
                width: size.width,
                height: 55.h,
                margin: EdgeInsets.only(top: 18.h),
                decoration: BoxDecoration(
                    color: color.withOpacity(.8),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22.r),
                        bottomRight: Radius.circular(22.r))),
                child: Center(
                  child: customText(title, textAlign: TextAlign.center),
                ))
          ],
        ),
      ),
    );
  }
}
