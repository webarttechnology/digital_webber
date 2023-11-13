import 'package:digitalwebber/view/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DesignTemplateScreen extends StatelessWidget {
  const DesignTemplateScreen({
    super.key,
    this.listItem,
    this.index,
    this.headerData,
    this.iconList,
  });
  final int? index;
  final List? headerData;
  final List? listItem;
  final List? iconList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            leading: BackButton(color: kWhite),
            elevation: 5,
            backgroundColor: kPrimary,
            title: customText(headerData![index!][2], color: kWhite),
          ),
          body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            padding: EdgeInsets.all(12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customHeading(headerData![index!][3],
                    fontSize: 22.sp, color: kPrimary.withOpacity(.8)),
                SizedBox(height: 16.h),
                customText(
                  headerData![index!][4],
                  color: Colors.grey.shade500,
                  fontWeight: fwNormal,
                ),
                SizedBox(height: 16.h),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    // padding: const EdgeInsets.all(12),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemCount: listItem!.length,
                    itemBuilder: (context, index) {
                      var item = listItem?[index];
                      var icon = iconList?[index];
                      return Container(
                          width: 1.sw,
                          padding: EdgeInsets.all(12.h),
                          decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.circular(5.r),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 8,
                                    color: Color.fromARGB(255, 219, 216, 216),
                                    blurStyle: BlurStyle.outer),
                              ]),
                          child: Column(
                            children: [
                              Image.asset(
                                icon,
                                height: 36.h,
                                color: kPrimary,
                              ),
                              SizedBox(height: 12.h),
                              customText(item[0],
                                  fontSize: 22.sp,
                                  color: kPrimary.withOpacity(.8)),
                              SizedBox(height: 12.h),
                              customText(item[1],
                                  fontWeight: fwNormal,
                                  color: kPrimary.withOpacity(.5),
                                  textAlign: TextAlign.center),
                            ],
                          ));
                    }),
                SizedBox(height: 16.h),
              ],
            ),
          )),
    );
  }
}
