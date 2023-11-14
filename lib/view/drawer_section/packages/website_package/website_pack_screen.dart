import 'dart:math';

import 'package:digitalwebber/view/drawer_section/packages/website_package/widgets/package_widget.dart';
import 'package:digitalwebber/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebsitePackageScreen extends StatefulWidget {
  const WebsitePackageScreen({super.key});

  @override
  State<WebsitePackageScreen> createState() => _WebsitePackageScreenState();

  static const tabData = ["Basic", "Advance", "Enterprice"];
}

class _WebsitePackageScreenState extends State<WebsitePackageScreen> {
  TabController? _controller;

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: packages.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimary,
          title: customText('Packages', color: kWhite),
          leading: const BackButton(color: kWhite),
          bottom: TabBar(
            controller: _controller,
            isScrollable: true,
            indicatorColor: kSecondary3,
            labelPadding: const EdgeInsets.all(5),
            indicatorWeight: 5,
            onTap: (value) {},
            tabs: [
              for (int i = 0; i < packages.length; i++)
                Tab(
                  height: 42,
                  child: Container(
                      padding: EdgeInsets.all(8.h),
                      decoration: BoxDecoration(
                        color: kPrimary4,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: customText(
                        packages[i].toString(),
                        color: kBlack,
                      )),
                ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: <Widget>[
            for (int i = 0; i < packages.length; i++) const PackageWidget(),
            /*   Tab(
                child: customText(
              packages[i].toString(),
              color: kBlack87,
            )), */
          ],
        ),
      ),
    );
  }

  static const packages = [
    "Review & Analysis",
    "On Page SEO Analysis",
    "Local SEO",
    "Content Marketing",
    "Email Outreach",
    "On Page SEO",
    "Reporting"
  ];
}
