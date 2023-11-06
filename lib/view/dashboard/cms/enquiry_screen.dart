import 'package:digitalwebber/view/dashboard/cms/widgets/contact_widget.dart';
import 'package:digitalwebber/view/dashboard/cms/widgets/enquiry_widget.dart';
import 'package:digitalwebber/view/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnquiryScreen extends StatefulWidget {
  const EnquiryScreen({super.key});

  @override
  State<EnquiryScreen> createState() => _EnquiryScreenState();
}

class _EnquiryScreenState extends State<EnquiryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        kPrimary,
                        kPrimary,
                        kPrimary2,
                        kPrimary2,
                        kPrimary3,
                        kSecondary3,
                        // kBackground,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      customLogo('assets/logo.png', size: 58, onTap: () {}),
                      const SizedBox(height: 16),
                      customHeading('Contact Us', fontSize: 26),
                      const SizedBox(height: 16),
                      const EnquiryWidget(),
                      Divider(
                        color: kSecondary3,
                        indent: .3.sw,
                        endIndent: .3.sw,
                        height: 40,
                      ),
                      const SizedBox(height: 36),
                      customHeading('Contact Details'),
                      const SizedBox(height: 12),
                      const ContactWidget(
                        title: 'India Office',
                        itemList: indiaOfficeList,
                      ),
                      SizedBox(height: 24.h),
                      const ContactWidget(
                        title: 'Australia Office',
                        itemList: ausOfficeList,
                      ),
                      SizedBox(height: 24.h),
                      const ContactWidget(
                        title: 'Contact Number',
                        itemList: contactList,
                      ),
                      SizedBox(height: 8.h),
                      Divider(
                        color: Colors.white,
                        height: 20.h,
                        indent: .3.sw,
                        endIndent: .3.sw,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  static const indiaOfficeList = [
    [
      "",
      "Address",
      "GP Block, Sector V, Bidhannagar, Kolkata, West Bengal 700091"
    ],
    ["", "Email", "info@digitalwebber.com"],
    ["", "Phone", "+91 3346026067"],
  ];
  static const ausOfficeList = [
    ["", "Address", "Suite 10, Level 14, 327 Pitt Street, Sydney 2000 (AUS)"],
    ["", "Email", "sales@digitalwebber.com"],
    ["", "Phone", "+61 02 8005 1155"],
  ];
  static const contactList = [
    ["Legal Affairs", "Phone", "+91 9748677059"],
    ["Human Resource", "Phone", "+91 9051955309"],
    ["USA Support", "Phone", "+1 415 800 3074"],
    ["Toll-Free", "Phone", "+1 888 927 7332"],
  ];
}
