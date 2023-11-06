import 'package:digitalwebber/view/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget({
    super.key,
    this.color,
    required this.title,
    required this.subtitle,
  });
  final dynamic color;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      // margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: color.withOpacity(.2),
          borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60.r,
            backgroundColor: color.withOpacity(.5),
            child: customHeading(title, fontSize: 32.sp),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 40,
            width: .3.sw,
            child: customHeading(subtitle,
                textAlign: TextAlign.center,
                fontSize: 18.sp,
                color: color.withOpacity(.7)),
          ),
        ],
      ),
    );
  }
}
