import 'package:digitalwebber/view/dashboard/carrer/widgets/carrer_widget.dart';
import 'package:digitalwebber/view/dashboard/homescreen/widgets/card_widget.dart';
import 'package:digitalwebber/view/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarrerScreen extends StatefulWidget {
  const CarrerScreen({super.key});

  @override
  State<CarrerScreen> createState() => _CarrerScreenState();
}

class _CarrerScreenState extends State<CarrerScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _nameCntrl = TextEditingController();
  final _emailCntrl = TextEditingController();
  final _mobileCntrl = TextEditingController();
  final _countryCntrl = TextEditingController();
  final _commentCntrl = TextEditingController();
  String expItem = "";
  String applyItem = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    // height: 350.h,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: <Color>[
                          kPrimary,
                          kPrimary,
                          kPrimary2,
                          kPrimary3,
                          kPrimary4,
                          kWhite
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    padding: EdgeInsets.all(12.h),
                    // margin:  EdgeInsets.only(bottom: 22.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customLogo('assets/logo.png', size: 58, onTap: () {}),
                        SizedBox(height: 24.h),
                      ],
                    )),
                Container(
                    color: kWhite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 1),
                        itemCount: careerList.length,
                        itemBuilder: (context, index) {
                          var item = careerList[index];
                          return CardWidget(
                            text: item[0].toString(),
                            imageName: item[1].toString(),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  barrierColor: kBlack87,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: CarrerWidget(
                                          index: index, headerData: careerList),
                                      contentPadding: const EdgeInsets.all(0),
                                    );
                                  });
                            },
                          );
                        })),
                Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customHeading('WE ARE HIRING',
                          fontSize: 22.sp, color: kBlack87),
                      SizedBox(height: 16.h),
                      customTextFormField(
                        hintText: 'Enter Your Full Name',
                        controller: _nameCntrl,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]'))
                        ],
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Full Name";
                          } else if (val.length < 3) {
                            return "Valid Name must be 3 Character";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      customTextFormField(
                        hintText: 'Email Address',
                        controller: _emailCntrl,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp('[a-zA-Z0-9@.]')),
                        ],
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Email Address";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      customTextFormField(
                        hintText: 'Phone Number',
                        controller: _mobileCntrl,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10)
                        ],
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Mobile Number";
                          } else if (val.length < 10) {
                            return "Mobile Number should be 10 Digit";
                          }
                          return null;
                        },
                      ),
                      /*  SizedBox(height: 10.h),
                      customTextFormField(
                        hintText: 'Country',
                        controller: _countryCntrl,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]'))
                        ],
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Country Name";
                          }
                          return null;
                        },
                      ), */
                      SizedBox(height: 10.h),
                      customDropdownButtonFormField(
                        hint: '-- Apply For --',
                        onChanged: (newValue) {
                          setState(
                              () => applyingList = newValue as List<String>);
                        },
                        items: /* []  */ applyingList.map((String lookItem) {
                          return DropdownMenuItem(
                              value: lookItem,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: <Widget>[
                                  customText(
                                    lookItem,
                                    color: kBlack87,
                                    fontWeight: fwNormal,
                                  ),
                                ],
                              ));
                        }).toList(),
                      ),
                      SizedBox(height: 10.h),
                      customDropdownButtonFormField(
                        hint: '-- Choose an Option --',
                        onChanged: (newValue) {
                          setState(() {
                            expList = newValue as List<String>;
                            expItem = newValue.toString();
                          });
                        },
                        items: /*  [] */ expList.map((String refName) {
                          return DropdownMenuItem(
                              value: refName,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: <Widget>[
                                  customText(
                                    refName,
                                    color: kBlack87,
                                    fontWeight: fwNormal,
                                  )
                                ],
                              ));
                        }).toList(),
                      ),
                      SizedBox(height: 10.h),
                      customTextFormField(
                        hintText: 'Leave a Comment here',
                        controller: _commentCntrl,
                        maxLines: 3,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp('[a-zA-Z0-9 ]'))
                        ],
                      ),
                      SizedBox(height: 24.h),
                      customOutlineButton(
                        "Submit",
                        backgroundColor: kPrimary,
                        borderColor: kPrimary,
                        width: 1.sw,
                        height: 48.h,
                        borderRadius: 8.r,
                        onTap: () async {
                          if (_formKey.currentState!.validate() &&
                              expItem.contains("") &&
                              applyItem.contains("")) {
                            print(expItem);
                            print(applyItem);
                            Scaffold.of(context)
                                .showBottomSheet((context) => Container(
                                      child: customText(
                                          "Fill all the Details in Form"),
                                    ));
                            _formKey.currentState!.save();
                          } else {
                            print(expItem);
                            print(applyItem);
                            // "Fill all the Details in Form";
                            // customText("Fill all the Details in Form");
                          }
                          /*     final Email email = Email(
                body: 'Testing\nHi There!',
                subject: 'testing',
                recipients: ['amit.sharma@webart.technology'],
                cc: [],
                bcc: [],
                attachmentPaths: [/* '/path/to/attachment.zip' */],
                isHTML: false,
              );
              await FlutterEmailSender.send(email); */
                        },
                      ),
                      Divider(
                        color: kPrimary3,
                        indent: .3.sw,
                        endIndent: .3.sw,
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static const careerList = [
    [
      "Website Consultant",
      "assets/sitedata/hiring.png",
      "Website Consultant",
      demoText
    ],
    [
      "Full Stack Developer",
      "assets/sitedata/hiring.png",
      "Full Stack Developer",
      demoText
    ],
    [
      "Marketing Head",
      "assets/sitedata/hiring.png",
      "Marketting Head",
      demoText
    ],
  ];
  static List<String> applyingList = [
    "Web Consultant",
    "Senior Web Designer",
    "Senior Web Developer",
    "Graphics Designer",
    "Content Writer",
    "Other"
  ];
  static List<String> expList = [
    "Fresher",
    "6 Months +",
    "1 Year +",
    "2 Year +",
    "3 Year +",
    "4 Year +",
    "5 Year +",
    "6 Year +",
    "7 Year +",
    "8 Year and More",
  ];
}
