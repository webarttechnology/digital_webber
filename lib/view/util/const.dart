import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

customLogo(image, {double size = 48, required Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Image.asset(
      image,
      height: size,
      width: size,
    ),
  );
}

customOutlineButton(
  String text, {
  void Function()? onTap,
  double? height,
  double? width,
  IconData? icon,
  Color? backgroundColor,
  Color? borderColor = Colors.white,
  double borderRadius = 0,
}) {
  return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius.r)),
            border: Border.all(
              color: borderColor!,
              width: 1,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            customHeading(text, fontSize: 18.sp),
          ],
        ),
      ));
}

customOutlineIconButton(String text,
    {void Function()? onTap, double? width, IconData? icon}) {
  return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 42,
        width: width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(
          color: kWhite,
          width: 1,
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: kWhite,
            ),
            SizedBox(width: 8.w),
            customHeading(text, fontSize: 18.sp),
          ],
        ),
      ));
}

customHeading(
  String text, {
  double? fontSize = 36,
  Color color = Colors.white,
  TextAlign textAlign = TextAlign.left,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    ),
  );
}

customText(
  String text, {
  double fontSize = 14,
  TextAlign textAlign = TextAlign.left,
  Color? color,
  TextOverflow? overflow = TextOverflow.visible,
  FontWeight fontWeight = FontWeight.w500,
}) {
  return Text(
    text,
    textAlign: textAlign,
    overflow: overflow,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}

customTextFormField(
    {required String hintText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
    int? maxLines = 1}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    inputFormatters: inputFormatters,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    maxLines: maxLines,
    cursorColor: kPrimary,
    // textAlign: TextAlign.center,
    textAlignVertical: TextAlignVertical.center,
    style: TextStyle(
      color: kBlack87,
      fontSize: 14.sp,
      fontStyle: FontStyle.normal,
    ),
    // scrollPadding: scrollPadding!,
    decoration: customInputDecoration(hintText: hintText),
  );
}

customDropdownButtonFormField(
    {required String hint,
    required List<DropdownMenuItem<Object>>? items,
    required void Function(Object?)? onChanged}) {
  return DropdownButtonFormField(
    // isDense: true,
    isExpanded: true,
    items: items,
    onChanged: onChanged,
    // alignment: Alignment.topLeft,
    style: TextStyle(
      color: kBlack87,
      fontStyle: FontStyle.normal,
    ),
    decoration: customInputDecoration(hintText: hint),
  );
}

customInputDecoration({required String hintText}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
    filled: true,
    hintStyle: TextStyle(
      color: Colors.grey.shade500,
      fontSize: 14.sp,
    ),
    focusColor: kSecondary3,
    hintText: hintText,
    errorStyle: const TextStyle(
      color: Colors.red,
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        borderSide: BorderSide(
          color: kWhite,
          width: 1,
        )),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        borderSide: BorderSide(
          color: kWhite,
          width: 1,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        borderSide: BorderSide(
          color: kWhite,
          width: 1,
        )),
  );
}

launchWebsite(String link) async {
  Uri url = Uri.parse(link);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw "Could not launch $link";
  }
}

Future<void> launchPhoneNumber(String phoneNumber) async {
  Uri url = Uri.parse('tel:$phoneNumber');

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $phoneNumber';
  }
}

Future launchSMS(String mobileNo) async {
  Uri smsUri = Uri.parse("sms:+91$mobileNo?body=hello%20there");
  if (await canLaunchUrl(smsUri)) {
    launchUrl(smsUri);
  } else {
    throw 'Could not launch $mobileNo';
  }
}

void launchEmail(String email) async {
  Uri emailAddress =
      Uri.parse('mailto:$email?subject=Enquiry&body=This is test');
  if (await canLaunchUrl(emailAddress)) {
    await launchUrl(emailAddress);
  } else {
    throw 'Could not launch $emailAddress';
  }
}

launchPlayStoreApp(String packageName) async {
  Uri googlePlayStoreURL =
      Uri.parse("https://play.google.com/store/apps/details?id=$packageName");
  if (await canLaunchUrl(googlePlayStoreURL)) {
    await launchUrl(googlePlayStoreURL);
  } else {
    throw 'Could not launch $packageName';
  }
}

/* Padding */
dynamic keyboardPadding(context) =>
    EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom);

/* Hex Color Scheme */
Color hexColor(String hexColor) => Color(int.parse("0xff$hexColor"));

///color scheme
//primary
const Color kPrimary = Color.fromARGB(255, 9, 47, 108);
const Color kPrimary2 = Color.fromARGB(255, 18, 70, 155);
const Color kPrimary3 = Color.fromARGB(255, 59, 118, 213);
const Color kPrimary4 = Color.fromARGB(255, 140, 179, 240);
//Secondary
const Color kSecondary = Color.fromARGB(255, 21, 105, 8);
const Color kSecondary2 = Color.fromARGB(255, 27, 141, 10);
const Color kSecondary3 = Colors.green;
const Color kSecondary4 = Color.fromARGB(255, 160, 241, 164);
//common
const Color kBackground = Color.fromARGB(255, 253, 246, 246);
Color kBlack = Colors.black;
Color kBlack54 = Colors.black54;
Color kBlack87 = Colors.black87;
Color kWhite = Colors.white;
Color kWhite70 = Colors.white70;

//font weight
FontWeight fwNormal = FontWeight.normal;

const String demoText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";   
/* floatingActionButton: FloatingActionButton(  
        backgroundColor: kPrimary,
        onPressed: () {
          setState(() {
            final random = Random();

            _width = random.nextInt(300) + 200.toDouble();
            _height = random.nextInt(30) + 40.toDouble();

            _color = Color.fromRGBO(
              random.nextInt(300),
              random.nextInt(300),
              random.nextInt(300),
              1,
            );

            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        child: const Icon(
          Icons.refresh,
          color: kWhite,
        ),
      ), */
