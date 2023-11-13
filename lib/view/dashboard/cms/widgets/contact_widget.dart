import 'package:digitalwebber/view/util/const.dart';
import 'package:digitalwebber/view/util/widgets_global/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
    required this.title,
    required this.itemList,
  });

  final List itemList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customHeading(title, fontSize: 24.sp),
        Divider(
          // indent: .02.sw,
          color: kWhite,
          endIndent: .6.sw,
          height: 20,
        ),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: itemList.length,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            separatorBuilder: (context, index) => SizedBox(height: 5.h),
            itemBuilder: (context, index) {
              var item = itemList[index];
              return GestureDetector(
                onTap: () {
                  if (item[1].contains('Email')) {
                    launchEmail(item[2]);
                  } else if (item[1].contains('Phone')) {
                    launchPhoneNumber(item[2]);
                  } else {
                    throw 'Could not launch ${item[1]}';
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (item[0].isEmpty)
                        ? const SizedBox()
                        : Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: customHeading(item[0], fontSize: 16.sp),
                          ),
                    CustomRichTextWidget(
                      title: "${item[1]} : ",
                      subtitle: item[2],
                      color: kWhite,
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }
}
