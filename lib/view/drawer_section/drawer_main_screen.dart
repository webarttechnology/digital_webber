import 'package:digitalwebber/demo.dart';
import 'package:digitalwebber/view/drawer_section/career/career_screen.dart';
import 'package:digitalwebber/view/dashboard_section/cms/aboutus_screen.dart';
import 'package:digitalwebber/view/dashboard_section/cms/contact_screen.dart';
import 'package:digitalwebber/view/dashboard_section/homescreen/home_screen.dart';
import 'package:digitalwebber/view/drawer_section/widgets/drawer_list_tile_widget.dart';
import 'package:digitalwebber/view/drawer_section/packages/package_main_screen.dart';
import 'package:digitalwebber/view/dashboard_section/servicescreen/service_screen.dart';
import 'package:digitalwebber/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerMainScreen extends StatelessWidget {
  const DrawerMainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: kPrimary,
      elevation: 10,
      width: .75.sw,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter, colors: [kPrimary, kPrimary3]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customLogo('assets/logo.png', size: 58, onTap: () {}),
                  SizedBox(height: 24.h),
                  customHeading('Digital Webber', fontSize: 22.sp),
                ],
              )),
          ListView.separated(
            itemCount: _drawerList.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
            /*  Divider(
              height: 8,
              indent: .05.sw,
              endIndent: .05.sw,
            ), */
            itemBuilder: (context, index) {
              var item = _drawerList[index];
              return DrawerListTileWidget(
                icon: item[0] as IconData,
                title: item[1].toString(),
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const HomeScreen(isBack: true)));
                      break;
                    case 1:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ServiceScreen(isBack: true)));
                      break;
                    case 2:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PackageScreen()));
                      break;
                    case 3:
                      launchWebsite("https://digitalwebber.com/blogs/blogs/");
                      // Scaffold.of(context).
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const Demo()));
                      break;
                    case 4:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CareerScreen()));
                      break;
                    case 5:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AboutUsScreen(isBack: true)));
                      break;
                    case 6:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ContactScreen(isBack: true)));
                      break;

                    default:
                      null;
                  }
                  /*   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Demo(),
                      )); */
                },
              );
            },
          ),
          // const Spacer(),
          // DrawerHeader(child: customText("v1.0.0", color: kBlack54)),
        ],
      ),
    );
  }

  static final _drawerList = [
    [Icons.home, "Home", const HomeScreen()],
    [Icons.settings, "Services", const ServiceScreen()],
    [Icons.folder_special_rounded, "Packages", const Demo()],
    [Icons.rss_feed_rounded, "Blog", const Demo()],
    [Icons.manage_search_rounded, "Carrer", const Demo()],
    [Icons.info, "About", const AboutUsScreen()],
    [Icons.contact_support_rounded, "Contact Us", const ContactScreen()],
  ];
}
