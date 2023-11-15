import 'package:digitalwebber/main.dart';
import 'package:digitalwebber/view/dashboard_section/cms/widgets/contact_widget.dart';
import 'package:digitalwebber/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key, this.isBack});
  final bool? isBack;

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _nameCntrl = TextEditingController();
  final _emailCntrl = TextEditingController();
  final _mobileCntrl = TextEditingController();
  final _countryCntrl = TextEditingController();
  final _commentCntrl = TextEditingController();
  String refItem = "";
  String lookItem = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimary2,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: widget.isBack == true
              ? AppBar(
                  leading: const BackButton(color: kWhite),
                  elevation: 5,
                  backgroundColor: kPrimary,
                  title: customText("Contact Us", color: kWhite),
                )
              : null,
          body: SafeArea(
            child: Container(
                constraints: const BoxConstraints.expand(),
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      // kPrimary.withOpacity(.8),
                      kPrimary2,
                      kPrimary4,
                      kPrimary4,
                      kSecondary3,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                padding: EdgeInsets.fromLTRB(12.h, 12.h, 12.h,
                    MediaQuery.of(context).viewInsets.bottom.h),
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 12.h),
                        customLogo('assets/logo.png', size: 58, onTap: () {
                          /*  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DashboardTab()),
                          ); */
                          // const DashboardTab();
                        }),
                        SizedBox(height: widget.isBack == false ? 16.h : 0),
                        widget.isBack == false
                            ? customHeading('Contact Us', fontSize: 26.sp)
                            : const SizedBox(),
                        SizedBox(height: 16.h),
                        customTextFormField(
                          hintText: 'Enter Your Full Name',
                          controller: _nameCntrl,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z ]'))
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
                        SizedBox(height: 10.h),
                        customTextFormField(
                          hintText: 'Country',
                          controller: _countryCntrl,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z ]'))
                          ],
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Country Name";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10.h),
                        customDropdownButtonFormField(
                          hint: 'Looking For',
                          onChanged: (newValue) {
                            setState(() => lookList = newValue as List<String>);
                          },
                          items: /* []  */ lookList.map((String lookItem) {
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
                          hint: 'From where you know about us',
                          onChanged: (newValue) {
                            setState(() {
                              refList = newValue as List<String>;
                              refItem = newValue.toString();
                            });
                          },
                          items: /*  [] */ refList.map((String refName) {
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
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Comment";
                            } else if (val.length < 3) {
                              return "Comment should be 10-100 Character";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 24.h),
                        customOutlineButton(
                          "Submit",
                          backgroundColor: kPrimary.withOpacity(.8),
                          borderColor: kSecondary2.withOpacity(.5),
                          width: 1.sw,
                          height: 48.h,
                          borderRadius: 8.r,
                          onTap: () async {
                            if (_formKey.currentState!.validate() &&
                                refItem.isNotEmpty &&
                                lookItem.isNotEmpty) {
                              _formKey.currentState!.save();
                            } else {
                              "Fill all the Details in Form";
                              customText("Fill all the Details in Form");
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
                        SizedBox(height: 36.h),
                        customHeading('Contact Details', color: kWhite),
                        SizedBox(height: 12.h),
                        const ContactWidget(
                          title: 'India Office',
                          itemList: indiaOfficeList,
                        ),
                        SizedBox(height: 24.h),
                        const ContactWidget(
                          title: 'Australia Office',
                          itemList: ausOfficeList,
                        ),
                        SizedBox(height: 24.h),
                        const ContactWidget(
                          title: 'Contact Number',
                          itemList: contactList,
                        ),
                        SizedBox(height: 8.h),
                        Divider(
                          color: kWhite,
                          height: 20.h,
                          indent: .3.sw,
                          endIndent: .3.sw,
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }

  static const indiaOfficeList = [
    [
      "",
      "Address",
      "GP Block, Sector V, Bidhannagar, Kolkata, West Bengal 700091"
    ],
    ["", "Email", "info@digitalwebber.com"],
    ["", "Phone", "+91 3346026067"],
  ];
  static const ausOfficeList = [
    ["", "Address", "Suite 10, Level 14, 327 Pitt Street, Sydney 2000 (AUS)"],
    ["", "Email", "sales@digitalwebber.com"],
    ["", "Phone", "+61 02 8005 1155"],
  ];
  static const contactList = [
    ["Legal Affairs", "Phone", "+91 9748677059"],
    ["Human Resource", "Phone", "+91 9051955309"],
    ["USA Support", "Phone", "+1 415 800 3074"],
    ["Toll-Free", "Phone", "+1 888 927 7332"],
  ];
  static List<String> lookList = [
    "Web Design & Development",
    "Mobile App Design & Development",
    "SEO, SMO & Other",
    "Web Hosting",
    "Other Enquiry"
  ];
  static List<String> refList = [
    "Through Google or Other Search Engine",
    "Through Social Media",
    "From Friend",
    "Other"
  ];
}
