import 'package:flutter/material.dart';
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
  double? borderRadius = 0,
}) {
  return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
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
          color: Colors.white,
          width: 1,
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 8,
            ),
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
  double fontSize = 15,
  TextAlign textAlign = TextAlign.left,
  Color color = Colors.white,
  TextOverflow? overflow,
}) {
  return Text(
    text,
    textAlign: textAlign,
    overflow: TextOverflow.visible ?? overflow,
    style: TextStyle(
        color: color, fontSize: fontSize, fontWeight: FontWeight.w500),
  );
}

customTextFormField({required String hintText}) {
  return TextFormField(
    style: const TextStyle(
      color: Colors.black87,
      fontStyle: FontStyle.normal,
    ),
    decoration: customInputDecoration(hintText: hintText),
  );
}

customInputDecoration({required String hintText}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
    // fillColor: Colors.green,
    filled: true,
    hintStyle: const TextStyle(color: Colors.grey),
    focusColor: kSecondary3,
    hintText: hintText,
    border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: Colors.white,
          width: 1,
        )),
    enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: Colors.white,
          width: 1,
        )),
    focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(
          color: Colors.white,
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

///color scheme
const Color kPrimary = Color.fromARGB(255, 9, 47, 108);
const Color kPrimary2 = Color.fromARGB(255, 18, 70, 155);
const Color kPrimary3 = Color.fromARGB(255, 59, 118, 213);
const Color kBackground = Color.fromARGB(255, 253, 246, 246);
const Color kSecondary = Color.fromARGB(255, 21, 105, 8);
const Color kSecondary2 = Color.fromARGB(255, 27, 141, 10);
const Color kSecondary3 = Colors.green;



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
          color: Colors.white,
        ),
      ), */