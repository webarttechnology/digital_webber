import 'package:digitalwebber/demo.dart';

import 'package:digitalwebber/view/dashboard/homescreen/digital_marketing/website_design_screen.dart';
import 'package:digitalwebber/view/dashboard/homescreen/mobile_app/mobile_app_screen.dart';
import 'package:digitalwebber/view/dashboard/homescreen/video_production/video_production_screen.dart';
import 'package:digitalwebber/view/dashboard/homescreen/website_design/website_design_screen.dart';
import 'package:digitalwebber/view/dashboard/homescreen/widgets/card_widget.dart';
import 'package:digitalwebber/view/dashboard/homescreen/widgets/drawer_widget.dart';
import 'package:digitalwebber/view/dashboard/homescreen/widgets/social_card_widget.dart';
import 'package:digitalwebber/view/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: kPrimary2,
      child: SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            key: _scaffoldKey,
            backgroundColor: kBackground,
            drawer: const DrawerWidget(),
            body: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: <Color>[kPrimary, kPrimary2],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      // color: const Color.fromARGB(255, 9, 47, 108),
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customLogo('assets/logo.png',
                                  size: 58, onTap: () {}),
                              Container(
                                decoration: BoxDecoration(
                                    color: kPrimary,
                                    borderRadius: BorderRadius.circular(12.r)),
                                padding: const EdgeInsets.all(0),
                                child: IconButton(
                                  color: kPrimary2,
                                  icon: Icon(
                                    Icons.menu,
                                    size: 28.h,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    _scaffoldKey.currentState!.openDrawer();
                                  },
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          customHeading(
                            "Better Ideas\nFor First\nGrowth",
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          customText(
                              'We are a full-service digital marketing firm that provides you with the ability to customize PPC, lead generation, inbound marketing, email campaigns, SEO-based responsive websites, marketing automation solutions, and more.'),
                          const SizedBox(
                            height: 18,
                          ),
                          customOutlineButton(
                            'Call Us',
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          customOutlineIconButton('+1 888-927-7332', onTap: () {
                            launchPhoneNumber('+1 888-927-7332');
                          }, icon: Icons.call),
                          const SizedBox(
                            height: 18,
                          ),
                          customHeading("Connect with us", fontSize: 24),
                          const SizedBox(
                            height: 18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customLogo(
                                'assets/icons/fb.png',
                                onTap: () {
                                  launchWebsite("https://www.facebook.com");
                                },
                              ),
                              customLogo(
                                'assets/icons/insta.png',
                                onTap: () {
                                  launchWebsite("https://www.instagram.com");
                                },
                              ),
                              customLogo(
                                'assets/icons/twitter.png',
                                onTap: () {
                                  launchWebsite("https://www.twitter.com");
                                },
                              ),
                              customLogo(
                                'assets/icons/webart.png',
                                onTap: () {
                                  launchWebsite("https://webart.technology/");
                                },
                              ),
                              customLogo(
                                'assets/icons/whatsapp.png',
                                onTap: () {
                                  launchPlayStoreApp("com.whatsapp");
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                        ],
                      )),
                  /* SizedBox(
                    height: 250,
                    child: ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, i) => const VerticalDivider(
                              width: 0,
                              indent: 50,
                              endIndent: 50,
                            ),
                        itemCount: cardDataList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var data = cardDataList[index];
                          return CardWidget(
                            text: data[0],
                            size: size,
                            imageName: data[1],
                          );
                        }),
                  ), */
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          // childAspectRatio: .8
                        ),
                        itemCount: cardDataList.length,
                        itemBuilder: (context, index) {
                          var data = cardDataList[index];
                          return CardWidget(
                            text: data[0],
                            imageName: data[1],
                            onTap: () {
                              switch (index) {
                                case 0:
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const WebsiteDesignScreen()));

                                  break;
                                case 1:
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DigitalMarketingScreen()));

                                  break;
                                case 2:
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MobileScreen()));

                                  break;
                                case 3:
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const VideoProductionScreen()));

                                  break;
                                default:
                                  null;
                              }
                            },
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 36, horizontal: 18),
                    child: Column(
                      children: [
                        customText('WHO WE ARE?',
                            fontSize: 18, color: Colors.black),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: featureList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: ((context, index) {
                              var item = featureList[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    const Icon(Icons.arrow_downward),
                                    Text(
                                      item[0],
                                      overflow: TextOverflow.visible,
                                      style: const TextStyle(
                                          color: Colors.black87),
                                    ),
                                    // customText(item[0], color: Colors.black45)
                                  ],
                                ),
                              );
                            })),
                      ],
                    ),
                  ),
                  // Container(
                  //   color: Colors.green,
                  //   width: size.width,
                  //   // height: 80,
                  //   margin: const EdgeInsets.only(bottom: 22),
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 18, vertical: 22),
                  //   child: customHeading('Our Specialization',
                  //       fontSize: 36, textAlign: TextAlign.center),
                  // ),
                  // ListView.separated(
                  //   separatorBuilder: (context, index) => const Divider(
                  //     indent: 50,
                  //     endIndent: 50,
                  //     height: 20,
                  //   ),
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemCount: socialCardList.length,
                  //   itemBuilder: (context, index) {
                  //     var item = socialCardList[index];
                  //     return SocialCardWidget(
                  //       size: size,
                  //       imageName: item[1],
                  //       title: item[0],
                  //       subtitle: item[2],
                  //       color: item[3],
                  //       onTap: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (_) => Demo(
                  //                 title: item[0].toString(),
                  //                 color: item[3] as Color,
                  //               ),
                  //             ));
                  //       },
                  //     );
                  //   },
                  // ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          kSecondary3,
                          kPrimary3,
                          kPrimary2,
                          // kBackground,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        customText('WHAT WE ACHIEVE?',
                            fontSize: 18, color: kBackground),
                        ListView.separated(
                            separatorBuilder: (context, index) => const Divider(
                                  indent: 50,
                                  endIndent: 50,
                                  height: 20,
                                ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: clientList.length,
                            itemBuilder: ((context, index) {
                              var item = clientList[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    customHeading(item[0]),
                                    customText(item[1],
                                        color: Colors.grey.shade300,
                                        fontSize: 22),
                                  ],
                                ),
                              );
                            })),
                      ],
                    ),
                  ),
                  /* Container(
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent.withOpacity(.1)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 36, horizontal: 12),
                      // margin: const EdgeInsets.only(bottom: 20),
                      // height: 500,
                      width: size.width,
                      child: Column(
                        children: [
                          customHeading(
                            'Innovative Steps\nto Build a \nDigital Product',
                            textAlign: TextAlign.center,
                            color: const Color.fromARGB(220, 148, 94, 158),
                          ),
                          SizedBox(height: 24.h),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: footerDataList.length,
                              separatorBuilder: (context, index) => Divider(
                                    indent: .3.sw,
                                    endIndent: .3.sw,
                                  ),
                              itemBuilder: (context, index) {
                                var item = footerDataList[index];
                                return FooterCircleWidget(
                                  title: item[0].toString(),
                                  subtitle: item[1].toString(),
                                  color: item[2] as Color,
                                );
                              })
                        ],
                      )), */
                ],
              ),
            )),
      ),
    );
  }

  static const cardDataList = [
    ["Website Design", "assets/sitedata/website.png"],
    ["Digital Marketing", "assets/sitedata/digital.png"],
    ["Mobile App", "assets/sitedata/mobile.png"],
    ["Video Production", "assets/sitedata/video.png"],
  ];
  static const featureList = [
    ["We believe in cost-effective and productive solutions, which we offer."],
    ["We deliver the digital results you desire based on your needs."],
    [
      "We provide exceptional digital solutions that have propelled us to new heights."
    ],
    ["We are concerned about our customers and their requirements."],
  ];
  static const clientList = [
    ["1900+", "Clients"],
    ["80 %", "Success Rate"],
    ["90 %", "Client Retention Rate"],
    ["1400+", "Project Delivery"],
  ];
  static const socialCardList = [
    [
      "Social Media Marketing",
      "assets/sitedata/website.png",
      "We have continually progressed and are becoming a powerful online marketing resource for companies and brands on social media platforms like Facebook, Twitter, LinkedIn, Pinterest, and Instagram.",
      Colors.purple
    ],
    [
      "Email Marketing",
      "assets/sitedata/digital.png",
      "Our engaging emails encourage customers to become more interested in your business. Our campaign's success depends on sending email to the right person at the right time.",
      Colors.orange
    ],
    [
      "SEO Management",
      "assets/sitedata/mobile.png",
      "Grow your business by using the recommended SEO strategies by our SEO experts to reach your targeted audience so they can easily discover your website in a more timely manner.",
      Colors.pink
    ],
    [
      "Search Engine Marketing\n(SEM)",
      "assets/sitedata/video.png",
      "Our engaging emails encourage customers to become more interested in your business. Our campaign's success depends on sending email to the right person at the right time.",
      Colors.blueAccent
    ],
  ];
}
