import 'package:digitalwebber/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackageWidget extends StatefulWidget {
  const PackageWidget({super.key});

  @override
  State<PackageWidget> createState() => _PackageWidgetState();
}

class _PackageWidgetState extends State<PackageWidget> {
  TabController? _nestedTabController;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: kPrimary4,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          labelPadding: const EdgeInsets.all(5),
          indicatorWeight: 5,
          onTap: (value) {},
          tabs: <Widget>[
            for (int i = 0; i < packs.length; i++)
              Tab(
                height: 42,
                child: Container(
                    padding: EdgeInsets.all(8.h),
                    decoration: BoxDecoration(
                      color: kSecondary3,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: customText(
                      packs[i].toString(),
                      color: kBlack,
                    )),
              ),
          ],
        ),
        SizedBox(
          height: screenHeight * 0.80,
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              for (int i = 0; i < packs.length; i++)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.blueGrey[300],
                  ),
                  child: customText(packs[i].toString()),
                ),
            ],
          ),
        )
      ],
    );
  }

  static const packs = [
    "Basic",
    "Advance",
    "Enterprise",
  ];
}
