import 'package:digitalwebber/view/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard(
      {super.key,
      this.color,
      required this.imageName,
      required this.title,
      required this.content,
      required this.onTap,
      this.onNavigate});
  final dynamic color;
  final String imageName;
  final String title;
  final String content;
  final void Function()? onTap;
  final void Function()? onNavigate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        // height: _height,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(.3),
          borderRadius: BorderRadius.circular(24.r),
        ),
        // duration: const Duration(seconds: 1),
        // curve: Curves.fastOutSlowIn,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    imageName,
                    opacity: const AlwaysStoppedAnimation(.4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: customText(
                    content,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
            SizedBox(height: 12.h),
            GestureDetector(
              onTap: onNavigate,
              child: Container(
                height: 48.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                alignment: Alignment.center,
                child: customHeading(title,
                    textAlign: TextAlign.center, fontSize: 20.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
