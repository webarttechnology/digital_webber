import 'dart:convert';

import 'package:digitalwebber/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebsiteWidget extends StatefulWidget {
  const WebsiteWidget({super.key, required this.data});

  final Map<String, Object> data;
  @override
  State<WebsiteWidget> createState() => _WebsiteWidgetState();
}

class _WebsiteWidgetState extends State<WebsiteWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        body: Container(
          padding: EdgeInsets.all(8.h),
          // margin: EdgeInsets.all(8.h),
          decoration: BoxDecoration(
            // color: widget.data["color"]!.withOpacity(.2),
            border: Border(
              left: BorderSide(
                color: widget.data["color"] as Color,
                width: 5.w,
              ),
            ),
            // borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customHeading(
                widget.data["title"].toString(),
                color: widget.data["color"] as Color,
              ),
              customHeading(widget.data["type"].toString(),
                  fontSize: 28.sp, color: kBlack87),
              SizedBox(height: 8.h),
              customText(widget.data["subtitle"].toString(),
                  color: kBlack54, fontWeight: fwNormal),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: widget.data.length,
                    padding: EdgeInsets.all(12.h),
                    separatorBuilder: (context, j) => const Divider(
                          height: 30,
                          color: kBlack54,
                        ),
                    itemBuilder: (context, index) {
                      var item = widget.data["items"];
                      return customText(
                        "Demo Word",
                        // item[index],
                        color: kBlack87,
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
