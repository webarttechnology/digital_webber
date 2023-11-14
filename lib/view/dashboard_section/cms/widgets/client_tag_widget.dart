import 'package:digitalwebber/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientTagWidget extends StatelessWidget {
  const ClientTagWidget({
    super.key,
    required this.image,
    required this.onTap,
  });
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.h),
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(5.r),
            boxShadow: [
              BoxShadow(
                  blurRadius: 8.r,
                  color: const Color.fromARGB(255, 219, 216, 216),
                  blurStyle: BlurStyle.outer),
            ]),
        child: Center(
          child: Image.asset(
            image,
            height: 36,
          ),
        ),
      ),
    );
  }
}
