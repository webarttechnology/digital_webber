import 'package:digitalwebber/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FooterCircleWidget extends StatelessWidget {
  const FooterCircleWidget({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
  });
  final Color color;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      width: double.infinity,
      // margin:  EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
          color: color.withOpacity(.2),
          borderRadius: BorderRadius.circular(24.r)),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60.r,
            backgroundColor: color.withOpacity(.7),
            child: customHeading(title, fontSize: 32.sp),
          ),
          SizedBox(height: 12.h),
          customHeading(subtitle,
              textAlign: TextAlign.center, fontSize: 18.sp, color: color),
        ],
      ),
    );
  }
}
