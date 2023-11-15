import 'package:digitalwebber/util/const.dart';
import 'package:digitalwebber/util/widgets_global/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarrerWidget extends StatelessWidget {
  const CarrerWidget({
    super.key,
    required this.index,
    required this.headerData,
  });
  final int? index;
  final List headerData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: kWhite,
          body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            padding: EdgeInsets.all(16.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CloseButton(
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
              customHeading("Process : ${headerData[index!][2]}",
                  fontSize: 18.sp, color: kSecondary3),
              Divider(height: 24.h),
              customText("Job Brief for ${headerData[index!][2]} :",
                  color: kBlack87, fontWeight: FontWeight.bold),
              SizedBox(height: 8.h),
              customText(
                headerData[index!][3],
                color: Colors.grey.shade600,
                fontWeight: fwNormal,
              ),
              SizedBox(height: 12.h),
              customText("Eligibility criteria :",
                  color: kBlack87, fontWeight: FontWeight.bold),
              SizedBox(height: 8.h),
              customText(
                  "1. Excellent communication skill and fluency in English language.",
                  color: Colors.grey.shade600),
              SizedBox(height: 8.h),
              customText("2. Basic knowledge in computer operation.",
                  color: Colors.grey.shade600),
              SizedBox(height: 8.h),
              customText("3. Minimum qualification: 12th standard.",
                  color: Colors.grey.shade600),
              SizedBox(height: 8.h),
              customText("4. Experienced and fresher are both welcomed.",
                  color: Colors.grey.shade600),
              SizedBox(height: 8.h),
              customText(
                  "5. Candidates should be comfortable to work in night shift.",
                  color: Colors.grey.shade600),
              SizedBox(height: 12.h),
              CustomRichTextWidget(
                  title: "Interview Process : ",
                  subtitle: "HR & Technical (Basic Quality) Round",
                  subColor: Colors.grey.shade600),
              CustomRichTextWidget(
                  title: "Job type : ",
                  subtitle: "Full Time",
                  subColor: Colors.grey.shade600),
              CustomRichTextWidget(
                  title: "Night Shift : ",
                  subtitle: "9:00-6:00 am",
                  subColor: Colors.grey.shade600),
              CustomRichTextWidget(
                  title: "Job location : ",
                  subtitle: "Ergo Tower, Block EP&GP, Sector V, WB, Kol–700091",
                  subColor: Colors.grey.shade600),
              CustomRichTextWidget(
                  title: "Facilities : ",
                  subtitle: "Saturday Sunday fixed off.",
                  subColor: Colors.grey.shade600),
              CustomRichTextWidget(
                  title: "Salary : ",
                  subtitle: "10K to 16K+",
                  subColor: Colors.grey.shade600),
              GestureDetector(
                onTap: () {
                  launchPhoneNumber("+91 9748677059");
                },
                child: const CustomRichTextWidget(
                    title: "Contact No : ",
                    subtitle: "+91 9748677059",
                    subColor: kBlack87),
              ),
            ]),
          )),
    );
  }
}
