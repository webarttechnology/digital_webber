import 'dart:async';
import 'package:digitalwebber/view/dashboard_section/cms/aboutus_screen.dart';
import 'package:digitalwebber/view/dashboard_section/cms/contact_screen.dart';
import 'package:digitalwebber/view/dashboard_section/homescreen/home_screen.dart';
import 'package:digitalwebber/view/dashboard_section/servicescreen/service_screen.dart';
import 'package:digitalwebber/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: kPrimary2, statusBarColor: kPrimary2));
  // await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Digital Webber',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: kPrimary),
              // appBarTheme: const AppBarTheme(color: kPrimary),
              useMaterial3: true,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardTab(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomRight,
            colors: [kPrimary, kPrimary3],
          ),
        ),
        child: Image.asset('assets/logo.png'));
  }
}

class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  int _selectedIndex = 0;
  final List _pages = [
    const HomeScreen(),
    const ServiceScreen(),
    const ContactScreen(),
    const AboutUsScreen()
  ];
  @override
  void initState() {
    super.initState();
    if (_selectedIndex != _selectedIndex) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(child: _pages.elementAt(_selectedIndex) //New
          ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.green.shade50,
        onTap: _onItemTapped,
        selectedItemColor: kPrimary,
        selectedFontSize: 12.sp,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 11.sp,
        unselectedItemColor: kSecondary3,
        unselectedLabelStyle: const TextStyle(color: kSecondary3),
        elevation: 20,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(width: .2.sw, child: const Icon(Icons.home)),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
                width: .3.sw, child: const Icon(Icons.design_services)),
            label: "Service",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(width: .3.sw, child: const Icon(Icons.task)),
            label: "Enquiry",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(width: .2.sw, child: const Icon(Icons.info)),
            label: "About Us",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launchPhoneNumber('+1 888-927-7332');
        },
        shape: const CircleBorder(),
        tooltip: 'Contact Support',
        backgroundColor: kPrimary,
        foregroundColor: kBlack,
        elevation: 20,
        child: CircleAvatar(
          backgroundColor: Colors.orange.shade300,
          radius: 25,
          child: const Icon(
            Icons.call_outlined,
            size: 28,
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
