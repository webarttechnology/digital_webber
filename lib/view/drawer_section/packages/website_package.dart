import 'dart:math';

import 'package:digitalwebber/view/drawer_section/packages/widgets/demo_widget.dart';
import 'package:digitalwebber/util/const.dart';
import 'package:digitalwebber/view/drawer_section/packages/widgets/website_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebsitePackageScreen extends StatefulWidget {
  const WebsitePackageScreen(
      {super.key, required this.title, required this.index});
  final String title;
  final int index;

  @override
  State<WebsitePackageScreen> createState() => _WebsitePackageScreenState();
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
      length: webdata.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimary,
          title: customText(widget.title, color: kWhite),
          leading: const BackButton(color: kWhite),
          bottom: TabBar(
            controller: _controller,
            isScrollable: true,
            indicatorColor: kWhite70,
            labelPadding: EdgeInsets.fromLTRB(3.h, 3.h, 3.h, 0),
            indicatorWeight: 4,
            onTap: (value) {},
            tabs: [
              for (int i = 0; i < webdata.length; i++)
                Tab(
                  height: 42,
                  child: Container(
                      padding: EdgeInsets.all(8.h),
                      decoration: BoxDecoration(
                        color: kWhite,
                        // border: Border.all(color: kSecondary3, width: 3),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: customText(
                          "${webdata[i]["title"]} ${webdata[i]["type"]}",
                          color: kBlack,
                          fontWeight: fwNormal)),
                ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: <Widget>[
            for (int i = 0; i < webdata.length; i++)
              // var ins= webdata[i]['items'];
              WebsiteWidget(data: webdata[i]),
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

  static const webdata = [
    {
      "title": "Basic",
      "type": "Package",
      "color": Colors.amber,
      "subtitle":
          "The Basic Package is perfect for small businesses looking to establish an online presence.",
      "items": [
        "Design Up to 20 Pages",
        "Graphic Design",
        "Logo Design",
        "Copywriter Services",
        "Professional Web Design",
        "Mobile Responsive Design",
        "Chatbot/Livechat Setup",
        "Social Media Integration"
      ]
    },
    {
      "title": "Advanced",
      "type": "Package",
      "color": Colors.purple,
      "subtitle":
          "Experience a website that reflects your brand and achieves your business goals.",
      "items": [
        "Design Up to 40 Pages",
        "Graphic Design",
        "Logo Design",
        "Copywriter Services",
        "Professional Web Design",
        "Mobile Responsive Design",
        "Chatbot/Livechat Setup",
        "Newsletter Integration",
        "Social Media Integration",
        "Google Analytics Setup",
        "Google Search Console Setup"
      ]
    },
    {
      "title": "Enterprise",
      "type": "Package",
      "color": Colors.cyan,
      "subtitle":
          "The ultimate web design solution for established businesses is to ensure your website exceeds your expectations.",
      "items": [
        "eCommerce Integration",
        "Design Up to 75 Pages",
        "Graphic Design",
        "Logo Design",
        "Copywriter Services",
        "Professional Web Design",
        "Mobile Responsive Design",
        "Chatbot/Livechat Setup",
        "Newsletter Integration",
        "Social Media Integration",
        "Schema Optimization",
        "Image Optimization",
        "Keyword Research",
        "Google Analytics Setup",
        "Google Search Console Setup",
        "Google My Business Optimization"
      ]
    }
  ];
}
