import 'package:digitalwebber/view/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      required this.imageName,
      required this.text,
      required this.onTap});

  final String imageName;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: .5.sw,
        decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(22.r),
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(22.r),
                  child: Image.asset(
                    'assets/sitedata/card-bg.png',
                    // width: double.infinity,
                    // height: 140,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Image.asset(
                  imageName,
                  height: 80.h,
                  width: 80.h,
                ),
              ],
            ),
            Container(
                // width: size.width,
                height: 42.h,
                decoration: BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22.r),
                        bottomRight: Radius.circular(22.r))),
                child: Center(
                  child: customText(text,
                      textAlign: TextAlign.center, color: kWhite),
                ))
          ],
        ),
      ),
    );
  }
}
