import 'package:digitalwebber/view/dashboard/cms/widgets/infocard_widget.dart';
import 'package:digitalwebber/view/util/const.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                    kSecondary,
                    kSecondary,
                    kSecondary2,
                    kSecondary3,
                    Colors.grey.shade100
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  // color: const Color.fromARGB(255, 9, 47, 108),
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customLogo('assets/logo.png', size: 58, onTap: () {}),
                      const SizedBox(
                        height: 12,
                      ),
                      customHeading('About Us'),
                      customText(
                          'Digital Webber produces uniquely creative and innovative design and flawless and bug free coding which ensures seamless execution and high performance. !!!',
                          fontSize: 18.sp,
                          color: Colors.white),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  )),
              Center(
                child: customText('WHO WE ARE?',
                    fontSize: 18, color: Colors.black),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/sitedata/cms_bg.gif",
                    height: featureList.length * 100,
                    opacity: const AlwaysStoppedAnimation(.3),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      // padding: EdgeInsets.symmetric(vertical: 20.h),
                      itemCount: featureList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                        var item = featureList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: const Icon(Icons.arrow_forward_ios),
                            title: customText(item[0],
                                overflow: TextOverflow.visible,
                                color: const Color.fromARGB(255, 34, 34, 34)
                                // style: const TextStyle(color: Colors.black87),
                                ),
                          ),
                        );
                      })),
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                    color: kSecondary.withOpacity(.4),
                    borderRadius: BorderRadius.circular(24)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customHeading(
                      'Intelligent &\nCreative',
                      color: Colors.black87,
                    ),
                    Divider(
                      color: kSecondary,
                      height: 40.h,
                    ),
                    customText(
                      data,
                      color: Colors.black54,
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
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customHeading(
                      'Our Success &\nAchievements',
                      color: Colors.black87,
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
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customHeading(
                      'We Work With',
                      color: Colors.black87,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    customText(
                        "It was a long journey to come where we are now. Here is how we started.",
                        color: Colors.black54),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(12),
                        itemCount: clientList.length,
                        itemBuilder: (context, index) {
                          var item = clientList[index];
                          return GestureDetector(
                            onTap: () {
                              launchWebsite(item[1]);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 8,
                                        color:
                                            Color.fromARGB(255, 219, 216, 216),
                                        blurStyle: BlurStyle.outer),
                                  ]),
                              child: Center(
                                child: Image.asset(
                                  item[0],
                                  height: 36,
                                ),
                              ),
                            ),
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
    );
  }

  static const featureList = [
    ["Analytics Tracking Code Installation & Dealing with Duplicate Issues"],
    ["Website Modification Consulting & Structure Data Implementation"],
    ["Structure Data Implementation & Monthly SEO Reports"],
  ];
  static const infoList = [
    ["302+", "Happy Customer", Colors.pink],
    ["502+", "Hosting Servers Sold", Colors.black],
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
