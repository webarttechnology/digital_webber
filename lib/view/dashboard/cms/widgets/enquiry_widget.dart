import 'package:digitalwebber/view/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnquiryWidget extends StatelessWidget {
  const EnquiryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customTextFormField(
          hintText: 'Enter Your Full Name',
        ),
        SizedBox(height: 10.h),
        customTextFormField(
          hintText: 'Email',
        ),
        SizedBox(height: 10.h),
        customTextFormField(
          hintText: 'Phone Number',
        ),
        SizedBox(height: 10.h),
        customTextFormField(
          hintText: 'Country',
        ),
        SizedBox(height: 10.h),
        customTextFormField(
          hintText: 'Looking For',
        ),
        SizedBox(height: 10.h),
        customTextFormField(
          hintText: 'From where you know about us',
        ),
        SizedBox(height: 10.h),
        customTextFormField(
          hintText: 'Leave a Comment here',
        ),
        SizedBox(height: 24.h),
        customOutlineButton(
          "Submit",
          backgroundColor: kSecondary3,
          borderColor: kPrimary,
          width: 1.sw,
          height: 48.h,
          borderRadius: 8,
          onTap: () {},
        ),
        // SizedBox(height: 24.h),
      ],
    );
  }
}
