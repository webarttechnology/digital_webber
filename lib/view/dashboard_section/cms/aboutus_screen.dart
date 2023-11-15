import 'package:digitalwebber/view/dashboard_section/cms/widgets/client_tag_widget.dart';
import 'package:digitalwebber/view/dashboard_section/cms/widgets/infocard_widget.dart';
import 'package:digitalwebber/util/const.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key, this.isBack});
  final bool? isBack;

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimary2,
      child: SafeArea(
        child: Scaffold(
          appBar: widget.isBack == true
              ? AppBar(
                  leading: const BackButton(color: kWhite),
                  elevation: 5,
                  backgroundColor: kPrimary,
                  title: customText("About Us", color: kWhite),
                )
              : null,
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
                            kSecondary,
                            kSecondary,
                            kSecondary2,
                            kSecondary3,
                            // kSecondary4,
                            kBackground
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      padding: EdgeInsets.all(12.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12.h),
                          customLogo('assets/logo.png', size: 58, onTap: () {}),
                          SizedBox(height: 16.h),
                          customHeading('About Us', fontSize: 26.sp),
                          SizedBox(height: 16.h),
                          customText(
                              'Digital Webber produces uniquely creative and innovative design and flawless and bug free coding which ensures seamless execution and high performance. !!!',
                              fontSize: 16.sp,
                              color: kWhite),
                          SizedBox(height: 32.h),
                        ],
                      )),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/sitedata/cms_bg.gif",
                        height: featureList.length * 100,
                        opacity: const AlwaysStoppedAnimation(.35),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          // padding: EdgeInsets.symmetric(vertical: 20.h),
                          itemCount: featureList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            var item = featureList[index];
                            return Padding(
                              padding: EdgeInsets.all(8.h),
                              child: ListTile(
                                leading: const Icon(Icons.arrow_forward_ios),
                                title: customText(item[0],
                                    overflow: TextOverflow.visible,
                                    color: kBlack87
                                    // style: const TextStyle(color: kBlack87),
                                    ),
                              ),
                            );
                          })),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    margin: EdgeInsets.all(12.h),
                    padding: EdgeInsets.all(16.h),
                    decoration: BoxDecoration(
                        color: kSecondary.withOpacity(.3),
                        borderRadius: BorderRadius.circular(24.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customHeading(
                          'Intelligent &\nCreative',
                          color: kBlack87,
                        ),
                        Divider(
                          color: kSecondary,
                          height: 40.h,
                        ),
                        customText(
                          data,
                          color: kBlack54,
                        ),
                        Divider(
                          color: kSecondary,
                          height: 20.h,
                          endIndent: .6.sw,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customHeading(
                          'Our Success &\nAchievements',
                          color: kBlack87,
                        ),
                        Divider(
                          color: kPrimary,
                          height: 40.h,
                        ),
                        GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                    childAspectRatio: .8),
                            itemCount: infoList.length,
                            itemBuilder: (context, index) {
                              var item = infoList[index];
                              return InfoCardWidget(
                                title: item[0].toString(),
                                subtitle: item[1].toString(),
                                color: item[2],
                              );
                            }),
                        SizedBox(height: 8.h),
                        Divider(
                          color: kSecondary,
                          height: 20.h,
                          indent: .3.sw,
                          endIndent: .3.sw,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(),
                    padding: EdgeInsets.all(12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customHeading('We Work With', color: kBlack87),
                        SizedBox(height: 12.h),
                        customText(
                            "It was a long journey to come where we are now. Here is how we started.",
                            color: kBlack54),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.all(12.h),
                            itemCount: clientList.length,
                            itemBuilder: (context, index) {
                              var item = clientList[index];
                              return ClientTagWidget(
                                image: item[0],
                                onTap: () {
                                  launchWebsite(item[1]);
                                },
                              );
                            }),
                        SizedBox(height: 8.h),
                        Divider(
                          color: kSecondary,
                          height: 20.h,
                          indent: .3.sw,
                          endIndent: .3.sw,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static const featureList = [
    ["Analytics Tracking Code Installation & Dealing with Duplicate Issues"],
    ["Website Modification Consulting & Structure Data Implementation"],
    ["Structure Data Implementation & Monthly SEO Reports"],
  ];
  static final infoList = [
    ["302+", "Happy Customer", Colors.pink],
    ["502+", "Hosting Servers Sold", kBlack],
    ["150+", "Our Data Centers", Colors.deepOrange],
    ["690+", "Team Members", Colors.teal],
  ];
  static const clientList = [
    ["assets/clients/client1.png", "https://www.drupal.org/"],
    [
      "assets/clients/client2.png",
      "https://account.magento.com/customer/account/login"
    ],
    ["assets/clients/client3.png", "https://www.mysql.com/"],
    ["assets/clients/client4.png", "https://jquery.com/"],
    ["assets/clients/client5.png", "https://wordpress.com/"],
    ["assets/clients/client6.png", "https://www.joomla.org/"],
    ["assets/clients/client7.png", "https://photodune.net/"],
    ["assets/clients/client8.png", "https://www.java.com/"],
  ];

  String data =
      'We, Digital Webber are a new generation, innovative, dynamic and result oriented Web Development Company based in Kolkata and Sydney. Since our inception in 2016 we have been providing top notch and world class service specializing in web design and development, graphic design and SEO services.Equipped with in depth knowledge of the latest and evolving technologies in design and development and combined with innovative, out of the box and unorthodox thinking, which brings out the optimal solution for the hardest of complexities.';
}
