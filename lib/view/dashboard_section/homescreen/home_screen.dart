import 'package:digitalwebber/demo.dart';
import 'package:digitalwebber/util/widgets_global/design_template_screen.dart';
import 'package:digitalwebber/view/dashboard_section/homescreen/widgets/card_widget.dart';
import 'package:digitalwebber/view/drawer_section/drawer_main_screen.dart';

import 'package:digitalwebber/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.isBack});
  final bool? isBack;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimary2,
      child: SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            key: _scaffoldKey,
            backgroundColor: kBackground,
            drawer: const DrawerMainScreen(),
            appBar: widget.isBack == true
                ? AppBar(
                    leading: const BackButton(color: kWhite),
                    elevation: 5,
                    backgroundColor: kPrimary,
                    // title: customText("Home", color: kWhite),
                  )
                : null,
            body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                      padding: EdgeInsets.all(12.h),
                      margin: EdgeInsets.only(bottom: 22.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customLogo('assets/logo.png',
                                  size: 58, onTap: () {}),
                              Container(
                                decoration: BoxDecoration(
                                    color: kPrimary,
                                    borderRadius: BorderRadius.circular(12.r)),
                                padding: EdgeInsets.all(0.h),
                                child: IconButton(
                                  color: kPrimary2,
                                  icon: Icon(
                                    Icons.menu,
                                    size: 28.h,
                                    color: kWhite,
                                  ),
                                  onPressed: () {
                                    _scaffoldKey.currentState!.openDrawer();
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 12.h),
                          customHeading("Better Ideas\nFor First\nGrowth",
                              color: kWhite),
                          SizedBox(height: 18.h),
                          customText(
                              'We are a full-service digital marketing firm that provides you with the ability to customize PPC, lead generation, inbound marketing, email campaigns, SEO-based responsive websites, marketing automation solutions, and more.',
                              color: kWhite),
                          SizedBox(height: 18.h),
                          customOutlineButton(
                            'Call Us',
                          ),
                          SizedBox(height: 18.h),
                          customOutlineIconButton('+1 888-927-7332', onTap: () {
                            launchPhoneNumber('+1 888-927-7332');
                          }, icon: Icons.call),
                          SizedBox(height: 18.h),
                          customHeading("Connect with us",
                              fontSize: 24.sp, color: kWhite),
                          SizedBox(height: 18.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customLogo(
                                'assets/icons/fb.png',
                                onTap: () {
                                  launchWebsite(
                                      "https://www.facebook.com/digitalwebber/");
                                },
                              ),
                              customLogo(
                                'assets/icons/insta.png',
                                onTap: () {
                                  launchWebsite(
                                      "https://www.instagram.com/digital_webber/");
                                },
                              ),
                              customLogo(
                                'assets/icons/twitter.png',
                                onTap: () {
                                  launchWebsite(
                                      "https://twitter.com/digiwebber?lang=en");
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
                                  launchWebsite(
                                      "https://wa.me/${"+918697844308"}?text=Hi\nI'm Interested.");
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 18.h),
                        ],
                      )),
                  /* SizedBox(
                    height: 250.h,
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
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
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
                                              DesignTemplateScreen(
                                                index: index,
                                                headerData: cardDataList,
                                                listItem: websiteList,
                                                iconList: iconData,
                                              )));

                                  break;
                                case 1:
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DesignTemplateScreen(
                                                index: index,
                                                headerData: cardDataList,
                                                listItem: mobileList,
                                                iconList: iconData,
                                              )));

                                  break;
                                case 2:
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DesignTemplateScreen(
                                                index: index,
                                                headerData: cardDataList,
                                                listItem: digitalList,
                                                iconList: iconData,
                                              )));

                                  break;
                                case 3:
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DesignTemplateScreen(
                                                index: index,
                                                headerData: cardDataList,
                                                listItem: videoList,
                                                iconList: iconData,
                                              )));

                                  break;
                                default:
                                  null;
                              }
                            },
                          );
                        }),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 36.h, horizontal: 18.w),
                    child: Column(
                      children: [
                        customText('WHO WE ARE?', fontSize: 18.sp),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: featureList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: ((context, index) {
                              var item = featureList[index];
                              return Padding(
                                padding: EdgeInsets.all(8.h),
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    const Icon(Icons.arrow_downward),
                                    Text(
                                      item[0],
                                      overflow: TextOverflow.visible,
                                      style: const TextStyle(color: kBlack87),
                                    ),
                                    // customText(item[0], color: kBlack45)
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
                  //   margin:  EdgeInsets.only(bottom: 22.h),
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 18, vertical: 22),
                  //   child: customHeading('Our Specialization',
                  //       fontSize: 36.sp, textAlign: TextAlign.center),
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
                    padding: EdgeInsets.all(18.h),
                    child: Column(
                      children: [
                        customText('WHAT WE ACHIEVE?',
                            fontSize: 18.sp, color: kBackground),
                        ListView.separated(
                            separatorBuilder: (context, index) => Divider(
                                  indent: 50,
                                  endIndent: 50,
                                  height: 20.h,
                                ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: clientList.length,
                            itemBuilder: ((context, index) {
                              var item = clientList[index];
                              return Padding(
                                padding: EdgeInsets.all(8.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    customHeading(item[0]),
                                    customText(item[1],
                                        color: Colors.grey.shade300,
                                        fontSize: 22.sp),
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
                      padding:  EdgeInsets.symmetric(
                          vertical: 36.h, horizontal: 12.w),
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
    [
      "Website Design",
      "assets/sitedata/website.png",
      "Website Design & Devs",
      "Website\nDevelopment",
      "Custom PHP development Crafting digital experiences that inspire and engage",
    ],
    [
      "Mobile App",
      "assets/sitedata/mobile.png",
      "Mobile Application",
      "Mobile Application Development",
      "App development became simpler.In this exciting app development journey, start your own chapter. Every app is a journey to get going.",
    ],
    [
      "Digital Marketing",
      "assets/sitedata/digital.png",
      "Search Engine Optimization",
      "The right SEO strategies for your success",
      "Get into the search habit. Every SEO has a story to tell.",
    ],
    [
      "Video Production",
      "assets/sitedata/video.png",
      "Video Editing",
      "Start your video editing",
      "The powerful visuals that move your business forward.",
    ],
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
    ["80%", "Success Rate"],
    ["90%", "Client Retention Rate"],
    ["1400+", "Project Delivery"],
  ];
  static const iconData = [
    "assets/homeicon/web1_graphic.png",
    "assets/homeicon/web2_bootstrapping.png",
    "assets/homeicon/web3_optimized.png",
    "assets/homeicon/web4_content.png",
    "assets/homeicon/web5_security.png",
    "assets/homeicon/web6_bug.png"
  ];
  static const List websiteList = [
    [
      "Graphic Interface",
      "A specialization of web design that deals with the controls people use to interact with a website or app, including button displays and gesture controls.",
    ],
    [
      "Bootstrapping",
      "The technical part of making a website, focusing on code. Web development is further divided into “front-end” and “back-end,” explained below",
    ],
    [
      "Screen Optimized",
      "The process of making sure content is written in a way that it can reach the largest possible target audience. The process of optimizing content should include keywords.",
    ],
    [
      "Content Update",
      "Before you actually start making updates to your site, check your SEO & Add some multimedia elements to your site when you’re updating your website content.",
    ],
    [
      "Application Security",
      "The idea of building websites to function as expected, even when they are under attack. The concept involves a collection of security controls engineered into a Web application.",
    ],
    [
      "Error/Bug Fixing",
      "Bugs are going to happen, no matter how good the web developers are. It is important to understand the types of bugs in order to focus on the more dangerous process.",
    ],
  ];
  static const List mobileList = [
    [
      "Custom-made",
      "Our accomplished team of developers create mobile applications that are personalized to meet your specific business requirements. We work assiduously to ensure that the application is tailored to your needs.",
    ],
    [
      "User-Centric",
      "We recognize the paramount importance of user experience and design our applications with a user-centric interface. This guarantees that your customers have a seamless experience while using your application.",
    ],
    [
      "Cross-Platform",
      "We develop mobile applications that are compatible with both iOS and Android platforms, enabling you to reach a wider audience.",
    ],
    [
      "Punctual Delivery",
      "We place a high premium on your time and ensure that your mobile application is developed and delivered within the agreed timeframe.",
    ],
    [
      "Competitive Pricing",
      "Our pricing structure is highly competitive and transparent, without any concealed charges. We offer affordable pricing for our services, without compromising on quality.",
    ],
    [
      "24/7 Support",
      "We provide round-the-clock support to our esteemed clients, ensuring that their queries are promptly and efficiently addressed.",
    ],
  ];
  static const List digitalList = [
    [
      "Keyword Research",
      "We prioritise keyword research, which tells us how your customers are finding you and where they're finding your competitors. We provide strategic analysis to identify valuable organic traffic opportunities for your business and website. Our keyword research identifies the queries people use to find relevant websites and pages.",
    ],
    [
      "Competitor Research",
      "We give high priority to the process of identifying the strengths and weaknesses of your and your competitors' SEO. To reach your goal, rather than focusing on marketing strategy, you should focus on SEO strategy. Much like a typical competitive analysis, discover any gaps between you and your competitor with our research.",
    ],
    [
      "Off Page SEO",
      "Optimizing for off-site ranking factors for your valuable business involves improving search engine and user perceptions of your site's popularity, trustworthiness, relevance, and authority.",
    ],
    [
      "On-page SEO",
      "Our on-page SEO services come in a variety of sizes and shapes, all of which are based on data and scientific techniques. Through planning, execution, and reporting, our SEO service involves hands-on technical and strategic support at all stages of the process.",
    ],
    [
      "Content Optimization",
      "With each passing day, assist you in increasing traffic to your website. Enhance it with our tried-and-true content optimization processes developed over a decade of experience, and work on your existing content.",
    ],
  ];
  static const List videoList = [
    [
      "Film Making",
      "Filmmaking for your specific needs is a trend that is increasing day by day. It has become the most powerful marketing and promotional tool. We create films as per your needs for product marketing.",
    ],
    [
      "Advertisement Promo Video",
      "The smart choice for your next video advertisement, made with stunning visuals and brandable templates. Create video advertisements that will get more clicks and increase revenue for your concern. Services are available for businesses of all sizes.",
    ],
    [
      "Video Color Grading",
      "Get expert colour grading and colour correction for all types of videos. Our experts in colour correction assist individuals with creative adjustments in transforming their raw footage into cinematic-quality videos. We are in charge of perfectly grading footage in accordance with standards.",
    ],
    [
      "Short Promo Video",
      "Choose the promo video that best fits your event, business, and product. A major percentage of customers would rather learn about a product or service through video, and the rest of the marketers say video helps increase their sales.",
    ],
    [
      "Corporate Presentation",
      "Modern slide designs not only save time but also provide exclusive, elegant, and unique graphic content. Visually appealing slides get maximum audience attention, which helps them relate to the presenter’s words.",
    ],
    [
      "Infographic Video Making",
      "Entertain and inform with exceptional, gorgeous, animated infographics. Ask for a service to become an expert infographic video maker in no time. It's as easy as choosing your preferred template and editing the text. Before you’ve finished your morning coffee, get started with your morning coffee.",
    ],
  ];
}
