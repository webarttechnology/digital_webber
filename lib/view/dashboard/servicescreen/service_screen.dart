import 'package:digitalwebber/view/dashboard/homescreen/digital_marketing/website_design_screen.dart';
import 'package:digitalwebber/view/dashboard/homescreen/mobile_app/mobile_app_screen.dart';
import 'package:digitalwebber/view/dashboard/homescreen/video_production/video_production_screen.dart';
import 'package:digitalwebber/view/dashboard/homescreen/website_design/website_design_screen.dart';
import 'package:digitalwebber/view/dashboard/homescreen/widgets/card_widget.dart';
import 'package:digitalwebber/view/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  bool isVisible = false;
  bool fabVisible = true;
  ScrollController scrollViewController = ScrollController();
  @override
  void initState() {
    scrollViewController.addListener(() {
      if (scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (fabVisible == true) {
          setState(() {
            fabVisible = !fabVisible;
          });
        }
      } else {
        if (scrollViewController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (fabVisible == false) {
            setState(() {
              fabVisible = fabVisible;
            });
          }
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: !fabVisible,
        child: FloatingActionButton(
          onPressed: () {
            scrollViewController.animateTo(
                scrollViewController.position.minScrollExtent,
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease);
          },
          backgroundColor: kPrimary.withOpacity(.6),
          child: const Icon(
            Icons.arrow_upward,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 350,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                    kPrimary,
                    kPrimary2,
                    kPrimary3,
                    Colors.white
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
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
                      customHeading(
                        "“Assumptions are the termites of relationships.”",
                        fontSize: 28.sp,
                      ),
                      customText('―Henry Winkler.'),
                      SizedBox(
                        height: 18.h,
                      ),
                      customText('Here We Provide Several Services !!!',
                          fontSize: 18.sp, color: Colors.black),
                    ],
                  )),
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
                            childAspectRatio: .9),
                    itemCount: serviceList.length,
                    itemBuilder: (context, index) {
                      var item = serviceList[index];
                      return CardWidget(
                        text: item[0].toString(),
                        imageName: item[1].toString(),
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
              SizedBox(
                height: 36.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  static const serviceList = [
    [
      "Web Development",
      "assets/sitedata/website.png",
      Colors.blue,
      "Get customized designs that are sure to catch an eye."
    ],
    [
      "SEO",
      "assets/sitedata/seo.png",
      Colors.red,
      "Digital Webber is a hybrid SEO agency with over a decade of experience in delivering SEO services and campaigns to our clients from a vast and diverse range of industries."
    ],
    [
      "SMO",
      "assets/sitedata/smo.png",
      Colors.purple,
      "Social media optimization (SMO) is the use of social media networks to manage and grow an organization's message and online presence. As a digital marketing strategy."
    ],
    [
      "Graphics Design",
      "assets/sitedata/graphics.png",
      Colors.teal,
      "Captivate your audience with some stunning visuals to keep them immersed in your site and in the process of making it easy for them we make sure they find exactly what they need."
    ],
    [
      "Video Editing",
      "assets/sitedata/video.png",
      Colors.lime,
      "Digital Webber is a fully-capable, super awesome IT solution company that creates compelling narratives through cinema-grade videos designed to inspire, entertain—and sell."
    ],
    [
      "Mobile",
      "assets/sitedata/mobile.png",
      Colors.deepOrange,
      "Create new revenue streams: Apps will definitely increase both the volume and quality of sales from your customers."
    ],
    [
      "Logo Design",
      "assets/sitedata/logo.png",
      Colors.green,
      "At Digital Webber, we walk with our clients into an immersive journey of brand creation. This will include brand positioning exercises to help embed your brand into the heart of your clients."
    ],
    [
      "Lead Development",
      "assets/sitedata/lead.png",
      Colors.indigo,
      "Generating consumer interest for a product or service with the goal of turning that interest into a sale."
    ],
  ];
}
